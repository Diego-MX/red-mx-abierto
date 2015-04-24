class StagesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @stages = Stage.all
  end

  def update

  end
end
