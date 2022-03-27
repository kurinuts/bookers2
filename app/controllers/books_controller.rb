class BooksController < ApplicationController
  
  
  def create
    @book = Book.new(book.id)
    @book.user.id = current.id
    @book.save
    redirect_to books_path(book.id)
  end

  def show
    @books = Book(book.id)
    @book.user.id = current.id
  end

  def index
  end
  
 private
 
 def book_params
   params.require(:book).permit(:title, :opinion)
 end
end
