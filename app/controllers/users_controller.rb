class UsersController < ApplicationController
  
  def new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    @user.update
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(resource)
  end
  
  def destroy
  end

  private

  def user_params
    params.require(:user_id).permit(:email, :encrypted_password, :name)
  end
end
