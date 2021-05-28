class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:id])
    current_user.attend!(@event)
    redirect_to @event
  end

  def destroy
    @event = EventAttendee.find(params[:id]).attended_event
    current_user.cancel!(@event)
    redirect_to @event
  end
end
