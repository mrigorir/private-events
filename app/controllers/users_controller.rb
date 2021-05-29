class UsersController < ApplicationController
  before_action :find_user, only: %i[edit show update destroy]
  before_action :authenticate_user!, except: %i[index]

  def show
    # @user_attendance = current_user.attended_events
    @upcomming_attended_events = current_user.attended_events.where('event_date >= ?', Date.today).order('event_date ASC')
    @past_attended_events = current_user.attended_events.where('event_date <  ?', Date.today).order('event_date DESC')
    @upcomming_created_events = @user.created_events.where('event_date >= ?', Date.today).order('event_date ASC')
    @past_created_events = @user.created_events.where('event_date <  ?', Date.today).order('event_date DESC')
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
