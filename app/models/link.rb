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
        .select("links.original_url,('#{baseUrl}' || '/' || links.lookup_code) as shorten_url,sum(anl.click_count) as no_click,anl.link_id,group_concat(DISTINCT(anl.country)) as countries,group_concat(DISTINCT(anl.state)) as states,group_concat(DISTINCT(anl.city)) as cities")
        .group("links.id")
        .order("links.id desc")
    end

end
