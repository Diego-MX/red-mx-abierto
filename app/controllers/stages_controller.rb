class StagesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @stages = Stage.all
    @user_activities = current_user.user_activities
    @last_activity = current_user.last_activity
    @visualiza = 0
  end
end
