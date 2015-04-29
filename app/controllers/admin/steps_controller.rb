module Admin
  class StepsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_stage
    before_action :set_step, only: [:edit, :update, :destroy]
    layout 'admin'

    def index
      @step = Step.new
      @steps = @stage.steps.order('created_at ASC')
    end

    def create
      @step = @stage.steps.new(step_params)
      authorize @step
      if @step.save
        redirect_to admin_stage_steps_path(@stage), notice: I18n.t('admin.steps.notices.saved_successfully')
      else
        redirect_to admin_stage_steps_path(@stage), alert: I18n.t('admin.steps.alerts.save_failed')
      end
    end

    def update
      authorize @step
      if @step.update_attributes(step_params)
        redirect_to admin_stage_steps_path(@stage), notice: I18n.t('admin.steps.notices.saved_successfully')
      else
        redirect_to admin_stage_steps_path(@stage), alert: I18n.t('admin.steps.alerts.save_failed')
      end
    end

    def destroy
      authorize @step
      if @step.destroy
        redirect_to admin_stage_steps_path(@stage), notice: I18n.t('admin.steps.notices.deleted_successfully')
      else
        redirect_to admin_stage_steps_path(@stage), notice: I18n.t('admin.steps.alerts.delete_failed')
      end
    end

    private

    def set_stage
      @stage ||= Stage.find(params[:stage_id])
    end

    def set_step
      @step ||= Step.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:name, :position, :stage_id)
    end
  end
end
