class ToolsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @tools = Tool.all
  end

  # def new
  # end
  #
  # def create
  # end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
end
