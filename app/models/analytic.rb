class Analytic < ApplicationRecord
    validates_presence_of :link_id
    validates_uniqueness_of :link_id

    def self.insert_update_analytic_data(linkid,ip,city,country,state)
        self.create(link_id: linkid, ip: ip,state: state, country: country,city: city, click_count: 1)
        # exist_link_analytic = self.find_by_link_id(linkid)
        # if exist_link_analytic.nil? || exist_link_analytic.blank?
        #     self.create(link_id: linkid, ip: ip,state: state, country: country,city: city, click_count: 1)
        # else
        #     clickCount = exist_link_analytic.click_count.to_i + 1
        #     exist_link_analytic.update(ip: ip,state: state, country: country,city: city, click_count: clickCount.to_s) 
        # end      
    end


end
