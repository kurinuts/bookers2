class Book < ApplicationRecord
    has_one_attached :book
    belongs_to :user
    
    validates :book_name, presence: true
    validates :caption, presence: true
  
  def getbook
    if book.attached?
      book
    else
      redirect_to root_path
    end
  end
  
end
