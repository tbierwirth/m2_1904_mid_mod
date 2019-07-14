require 'rails_helper'

RSpec.describe Author, type: :model do

  describe "Relationships" do
    it {should have_many :author_books}
    it {should have_many :books}
  end

end
