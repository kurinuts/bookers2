class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
    @user = current_user
    @users = user.all
    # if @book.save
    # flash[:notice] = "successfully book_create"
    # redirect_to book_path(@book)
    # else
    # render :new
    # end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @users = User.all
    @books = Book.all
    @user = current_user
    if @book.save
      flash[:notice] = "successfully book_create"
    redirect_to book_path(@book)
    else
    render :new
    end
  end

  def show
    @post_book = Book.find(params[:id])
    @book = Book.new
    @user = @post_book.user
    # @book = current_user
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @post_book = Book.find(params[:id])
    @book = Book.new
    # @user = current_user
    # if @user
    # redirect_to edit_book_path(@post_book.id)
    # else
    # render :index
    # end
  end

  def update
    @post_book = Book.find(params[:id])
    @post_book.update(book_params)
    if @post_book.save
      flash[:notice] = "successfully book_update"
    redirect_to book_path(@post_book.id)
    else
    render :edit
    end
  end


  def destroy
    @post_book = Book.find(params[:id])
    if @post_book.destroy
    flash[:notice] = "successfully book_delete"
    redirect_to books_path
    else
    render :show
    end
  end

 private

 def book_params
   params.require(:book).permit(:title, :body)
 end

 def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end

