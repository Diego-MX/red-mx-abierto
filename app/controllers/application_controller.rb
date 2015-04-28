class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # let's verify that authorization is been handled for every view
  after_action :verify_authorized, :except => :index

  def authenticate_admin!
    current_user.admin? or not_found
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_stages_path
    else
      stages_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def verify_authorized
    super unless devise_controller?
  end

  private

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
