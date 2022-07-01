require "rails_helper"


RSpec.describe Link do

    it "always has an original url and short code" do
        link=Link.new{
            original_url:"http://www.fav.com/articals/helo/opp-thhh",
            lookup_code:"12345"
        }
        link.save
    end

    it "always has a lookup code" do
        url = "http://www.fav.com/articals/helo/opp"
        shortener = Shortener.new(url)
        code_1 = Shortener.lookup_code

        url = "http://www.fav.com/articals/helo/opp-thhh"
        shortener = Shortener.new(url)
        code_2 = Shortener.lookup_code

        expect(code_1).not_to eq(code_2)
    end

end