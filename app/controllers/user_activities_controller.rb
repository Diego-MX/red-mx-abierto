class UserActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_activity_params, only: :update

  def update
    @user_activity = UserActivity.find(user_activity_params[:id])
    authorize @user_activity
    if @user_activity.update(checked: user_activity_params[:checked])
      render json: @user_activity
    else
      raise @user_activity
    end
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:id, :checked)
  end
end
