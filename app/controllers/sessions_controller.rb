class SessionsController < ApplicationController
  def new; end

  def create
    @author = Author.find_by(email: params[:email])
    if @author && @author.authenticate(params[:password])
      session[:author_id] = @author.id
      redirect_to root_path, notice: 'You are successfully logged in!'
    else
      flash.now[:notice] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:author_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
