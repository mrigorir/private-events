class UsersController < ApplicationController
  before_action :find_user, only: %i[edit show update destroy]
  before_action :authenticate_user!, except: %i[index]

  def index; end

  def new; end

  def create; end

  def show
    @user_attendance = @user.attended_events
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
