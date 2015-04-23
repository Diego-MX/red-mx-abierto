class StagesController < ApplicationController
  before_action :set_stage_and_steps, only: :create
  # before_action :set_steps
  # before_action :set_activities

  layout 'admin'

  def index
    @stages = Stage.all
  end

  def new
    @stage = Stage.new
  end

  def create
    raise 1.inspect
  end

  private

  def set_stage_and_steps
    params.require(:stage).permit(:name, :position, :steps)
  end
end
