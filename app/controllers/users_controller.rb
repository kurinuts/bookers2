class UsersController < ApplicationController
  
  def new
    
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @user = current_user
    @post_book = Book.find(params[:id])
    @postuser = @post_book.user
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
    flash[:notice] = "successfully" 
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    # permit⇒sサイト内で編集するところを記載
  end
end
