module ApplicationHelper
  def header_background
    (user_signed_in? && current_user.admin?) ? 'admin-background' : 'azulado'
  end

  def no_left_border(idx)
    "no-left-border" if idx == 0
  end
end
