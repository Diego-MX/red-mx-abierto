class PagesController < ApplicationController
  def home
    # this view doesn't need authorization handling
    skip_authorization
    render layout: 'main'
  end


  def conditions
      skip_authorization
      render layout: 'devise'
  end
end
