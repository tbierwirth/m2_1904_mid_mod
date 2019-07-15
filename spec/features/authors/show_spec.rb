require 'rails_helper'

RSpec.describe "Author Show" do

  describe "As a Vistor" do
    before :each do
      @stephen_k = Author.create(name: "Stephen King")
      @peter_s = Author.create(name: "Peter Straub")
      @talisman = Book.create(title: "The Talisman", pages: 921, publication_year: 1984)
      @it = Book.create(title: "It", pages: 1138, publication_year: 1986)
      @stephen_k.books.push(@talisman, @it)
      @peter_s.books.push(@talisman)
    end

    describe "When I visit the books index page" do
      it "I can click each authors name to see their show page with their info" do
        visit books_path

        within "#book-#{@talisman.id}" do
          click_link "Stephen King"
          expect(current_path).to eq("/authors/#{@stephen_k.id}")
          expect(page).to have_content(@stephen_k.name)
          expect(page).to have_content(@talisman.title)
          expect(page).to have_content(@it.title)
          expect(page).to have_content("1030")
        end

        visit books_path

        click_link "Peter Straub"
        expect(current_path).to eq("/authors/#{@peter_s.id}")
        expect(page).to have_content(@peter_s.name)
        expect(page).to have_content(@talisman.title)
        expect(page).to have_content("921")
        end

      end
  end

end
