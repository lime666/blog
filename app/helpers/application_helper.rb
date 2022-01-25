module ApplicationHelper
  def modal_signup
    current_author.nil? && (cookies[:actions] % 5).zero?
  end
end
