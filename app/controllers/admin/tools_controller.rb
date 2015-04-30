module Admin
  class ToolsController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :set_tool, only: [:edit, :update, :destroy]

    def index
      @tools = Tool.all
    end

    def new
      @tool = Tool.new
      authorize @tool
    end

    def create
      @tool = Tool.new(tool_params)
      authorize @tool

      if @tool.save
        redirect_to admin_tools_path, notice: I18n.t('admin.tools.notices.saved_successfully')
      else
        redirect_to admin_tools_path, notice: I18n.t('admin.tools.alerts.save_failed')
      end
    end

    def edit
      authorize @tool
    end

    def update
      authorize @tool
      if @tool.update(tool_params)
        redirect_to admin_tools_path, notice: I18n.t('admin.tools.notices.saved_successfully')
      else
        redirect_to admin_tools_path, notice: I18n.t('admin.tools.alerts.save_failed')
      end
    end

    def destroy
      authorize @tool
      if @tool.destroy
        redirect_to admin_tools_path, notice: I18n.t('admin.tools.notices.deleted_successfully')
      else
        redirect_to admin_tools_path, notice: I18n.t('admin.tools.alerts.delete_failed')
      end
    end

    private

    def tool_params
      params.require(:tool).permit(:name, :description, :url, :icon)
    end

    def set_tool
      @tool = Tool.find(params[:id])
    end
  end
end
