require 'digest/sha2'
class Shortener
     
    attr_reader :url, :link_model

    def initialize(url,link_model = Link)
        @url = url
        @link_model = link_model
    end

    def generate_shorten_url
        link_model.create!(original_url: url, lookup_code: lookup_code,expire_date: Time.now + 1.month)
    end

    def lookup_code
        loop do
            code= SecureRandom.uuid[0..4]
            break code unless link_model.exists?(lookup_code: code)
        end
       
    end


end