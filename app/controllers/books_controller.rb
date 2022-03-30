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
  end
  
 private
 
 def book_params
   params.require(:book).permit(:book_name, :caption)
 end
end
