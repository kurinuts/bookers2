class UsersController < ApplicationController
before_action :authenticate_user!

  def new

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully user update"
    redirect_to user_path(@user)
    else
    render :edit
    end
  end

  def destroy
    # @user = User.find(params[:id])
    # if @user.destroy
    # flash[:notice] = "successfully destroy"
    # else
    #   render :users_path
    # end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    # permit⇒sサイト内で編集するところを記載
  end
end
