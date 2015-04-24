class StagesController < ApplicationController
  layout 'admin'

  def index
    @stages = Stage.all
  end
end
