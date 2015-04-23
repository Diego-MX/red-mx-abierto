class StagesController < ApplicationController
  layout 'admin'

  def index
    @stages = Stage.all
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    if @stage.save_and_add_new_steps(steps_params)
      redirect_to stages_path
    else
      redirect_to new_stage_path
    end
  end

  private

  def stage_params
    params.require(:stage).permit(:name, :position)
  end

  def steps_params
    params.require(:steps)
  end
end
