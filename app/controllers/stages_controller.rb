class StagesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @stages = Stage.all
    @user_activities = current_user.user_activities
  end

  def update
  end
end
