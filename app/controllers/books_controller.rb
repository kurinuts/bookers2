class BooksController < ApplicationController
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @post_book = Book.find(params[:id])
    @book = Book.new
    # @book = current_user
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def edit
    @post_book = Book.find(params[:id])
    @book = Book.new
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  
  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end
  
 private
 
 def book_params
   params.require(:book).permit(:book_name, :caption)
 end
end
