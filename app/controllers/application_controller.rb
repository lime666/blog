class ApplicationController < ActionController::Base
  helper_method :current_author
  #before_action :set_cookies

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def ensure_current_author
  	redirect_to sign_in_path, alert: "Please, sign in." if current_author.nil?
  end
end
