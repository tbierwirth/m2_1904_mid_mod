require 'rails_helper'

RSpec.describe "Books Index" do

  describe "As a Vistor" do
    before :each do
      @stephen_k = Author.create(name: "Stephen King")
      @peter_s = Author.create(name: "Peter Straub")
      @talisman = Book.create(title: "The Talisman", pages: 921, publication_year: 1984)
      @it = Book.create(title: "It", pages: 1138, publication_year: 1986)
      @stephen_k.books.push(@talisman, @it)
      @peter_s.books.push(@talisman)
    end

    it "I see each book with its info" do
      visit books_path

      within "#book-#{@talisman.id}" do
        expect(page).to have_content(@talisman.title)
        expect(page).to have_content(@talisman.pages)
        expect(page).to have_content(@talisman.publication_year)
        @talisman.authors.each do |author|
          expect(page).to have_content(author.name)
        end
      end

      within "#book-#{@it.id}" do
        expect(page).to have_content(@it.title)
        expect(page).to have_content(@it.pages)
        expect(page).to have_content(@it.publication_year)
        @it.authors.each do |author|
          expect(page).to have_content(author.name)
        end
      end

    end
  end
end
