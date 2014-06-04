class UsersController < ApplicationController
  before_action :load_user, only: [:approve, :lock, :unlock]
  def index
    @users = User.in_order
    @users = @users.find_by_approval(params[:approved]) if params[:approved].present?
    @users = @users.find_locked if params[:locked].present?
  end
  def approve
    @user.update(approved: true)
    redirect_to users_path
  end
  def lock
    @user.update(locked_at: Time.now)
    redirect_to users_path
  end
  def unlock
    @user.update(locked_at: nil)
    redirect_to users_path
  end
  private
    def load_user
      @user = User.find(params[:id])
    end
end
