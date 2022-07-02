class Link < ApplicationRecord
    validates_presence_of :lookup_code, :original_url
    validates_uniqueness_of :lookup_code
    validate :original_url_format

    def original_url_format
        uri = URI.parse(original_url || "")
        if uri.host.nil?
            errors.add(:original_url, "Invalid URL format")
        end
    end

    def shortened_url(baseUrl)
        url = baseUrl +"/"+ lookup_code
        return url
    end

    def self.fetch_analytics_data(baseUrl)
        self.joins("join analytics anl on anl.link_id = links.id")
        .select("*,('#{baseUrl}' || '/' || links.lookup_code) as shorten_url")
        .order("links.id desc")
    end

end
