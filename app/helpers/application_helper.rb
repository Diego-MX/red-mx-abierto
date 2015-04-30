module ApplicationHelper
  def header_background
    (user_signed_in? && current_user.admin?) ? 'admin-background' : 'azulado'
  end
end
