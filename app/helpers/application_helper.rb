module ApplicationHelper

  def modal_signup
    (cookies[:actions] % 5).zero?
  end

end
