class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  def average_pages
    average = books.average(:pages)
    average.to_i
  end
end
