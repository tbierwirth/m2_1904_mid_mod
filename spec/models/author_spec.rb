require 'rails_helper'

RSpec.describe Author, type: :model do

  describe "Relationships" do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe "Class Methods" do
    it "Average pages" do
      @stephen_k = Author.create(name: "Stephen King")
      @talisman = Book.create(title: "The Talisman", pages: 921, publication_year: 1984)
      @it = Book.create(title: "It", pages: 1138, publication_year: 1986)
      @stephen_k.books.push(@talisman, @it)

      expect(@stephen_k.average_pages).to eq(1029)
    end

  end

end
