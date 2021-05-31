class UsersController < ApplicationController
  before_action :find_user, only: %i[edit show update destroy]
  before_action :authenticate_user!, except: %i[index]

  def show
    # @user_attendance = @user.attended_events
    @upcomming_attended_events = current_user.attended_events.next
    @past_attended_events = current_user.attended_events.past
    @upcomming_created_events = @user.created_events.next
    @past_created_events = @user.created_events.past
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
