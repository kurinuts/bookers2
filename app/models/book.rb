class Book < ApplicationRecord
    has_one_attached :book
    belongs_to :user
  
  def getbook
    if book.attached?
      book
    else
      redirect_to root_path
    end
  end
  
end
