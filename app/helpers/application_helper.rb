module ApplicationHelper
  def modal_signup
    current_author.nil? && cookies[:actions].to_i > 5
  end
end
