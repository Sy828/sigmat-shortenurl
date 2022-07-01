require "rails_helper"


RSpec.describe Shortener do

    it "shortener url to a 5 char lookup code" do
        url = "http://www.fav.com/articals/helo/opp"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(5)
    end

    it "give each url its own lookup code" do
        url = "http://www.fav.com/articals/helo/opp"
        shortener = Shortener.new(url)
        code_1 = Shortener.lookup_code

        url = "http://www.fav.com/articals/helo/opp-thhh"
        shortener = Shortener.new(url)
        code_2 = Shortener.lookup_code

        expect(code_1).not_to eq(code_2)
    end

end