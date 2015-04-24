class StagesController < ApplicationController
  before_action :set_stage, only: [:edit, :update]
  layout 'admin'

  def index
    @stage = Stage.new
    @stages = Stage.all
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    if @stage.save(stage_params)
      redirect_to stages_path, notice: I18n.t('stages.notices.saved_successfully')
    else
      redirect_to stages_path, alert: I18n.t('stages.alerts.save_failed')
    end
  end

  def edit
  end

  def update
    if @stage.update_attributes(stage_params)
      redirect_to stages_path, notice: I18n.t('stages.notices.saved_successfully')
    else
      redirect_to stages_path, alert: I18n.t('stages.alerts.save_failed')
    end
  end

  private

  def set_stage
    @stage ||= Stage.find(params[:id])
  end

  def stage_params
    params.require(:stage).permit(:name, :position)
  end
end
