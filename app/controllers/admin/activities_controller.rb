module Admin
  class ActivitiesController < ApplicationController
    before_action :set_stage
    before_action :set_step
    before_action :set_activity, only: [:update]
    layout 'admin'

    def index
      @activity = Activity.new
      @activities = @step.activities
    end

    def create
      @activity = @step.activities.new(activity_params)
      if @activity.save(activity_params)
        redirect_to admin_stage_step_activities_path(@stage, @step), notice: I18n.t('admin.activities.notices.saved_successfully')
      else
        redirect_to admin_stage_step_activities_path(@stage, @step), alert: I18n.t('admin.activities.alerts.save_failed')
      end
    end

    def update
      if @activity.update_attributes(activity_params)
        redirect_to admin_stage_step_activities_path(@stage, @step), notice: I18n.t('admin.activities.notices.saved_successfully')
      else
        redirect_to admin_stage_step_activities_path(@stage, @step), alert: I18n.t('admin.activities.alerts.save_failed')
      end
    end


    private

    def set_stage
      @stage ||= Stage.find(params[:stage_id])
    end

    def set_step
      @step ||= Step.find(params[:step_id])
    end

    def set_activity
      @activity ||= Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :position)
    end
  end
end
