class EventsController < ApplicationController
  before_action :find_event, only: %i[edit show update destroy]
  before_action :authenticate_user!, except: %i[index]

  def index
    @next_events = Event.next
    @past_events = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event =  current_user.created_events.build(events_params)
    if @event.save
      flash[:notice] = 'Event created!'
      redirect_to @event
    else
      flash.now[:alert] = 'Check your inputs, something went wrong!'
      render :new
    end
  end

  def show
    @attendees = @event.attendees.order('name ASC')
    @attendance = Event.new  
  end

  def edit
  end

  def update
    if @event.update(events_params)
      flash[:notice] = 'Event updated!'
      render :show
    else
      flash.now[:alert] = 'Check your fields, something went wrong!'
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:alert] = 'Event has been removed'
    redirect_to root_path
  end

  def events_params
    params.require(:event).permit(:event_name, :event_location, :event_date, :description)
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
end
