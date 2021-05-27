class EventsController < ApplicationController
  before_action :find_event, only: %i[edit show update destroy]
  before_action :authenticate_user!, except: %i[index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
   @event = current_user.events.build(events_params)
    if @event.save
      flash[:notice] = 'Event created!'
      render :show
    else
      flash.now[:alert] = 'Check your inputs, something went wrong!'
      render :new
    end
  end

  def show  
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

  def events_params
    params.require(:event).permit(:event_name, :event_location, :event_date, :description)
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
end
