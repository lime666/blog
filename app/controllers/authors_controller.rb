class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to root_path, notice: 'Thank you! Your account has been created!'
    else
      render 'new'
    end
  end

  def destroy; end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
