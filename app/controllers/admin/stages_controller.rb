module Admin
  class StagesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_stage, only: [:edit, :update]
    layout 'admin'

    def index
      @stage = Stage.new
      @stages = Stage.all.order('created_at ASC')
    end

    def create
      @stage = Stage.new(stage_params)
      authorize @stage
      if @stage.save
        redirect_to admin_stages_path, notice: I18n.t('admin.stages.notices.saved_successfully')
      else
        redirect_to admin_stages_path, alert: I18n.t('admin.stages.alerts.save_failed')
      end
    end

    def update
      authorize @stage
      if @stage.update_attributes(stage_params)
        redirect_to admin_stages_path, notice: I18n.t('admin.stages.notices.saved_successfully')
      else
        redirect_to admin_stages_path, alert: I18n.t('admin.stages.alerts.save_failed')
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
end
