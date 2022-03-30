class Book < ApplicationRecord
  
  def getbook
    if book.attached?
      book
    else
      redirect_to root_path
    end
  end
  
end
