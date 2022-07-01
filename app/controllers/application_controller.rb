class ApplicationController < ActionController::Base

    def get_analytics(link)
        ip = request.remote_ip
        location = fetch_location_by_ip(ip)
        city = !request.location.city.nil? && !request.location.city.blank? ? request.location.city : location['city'].to_s
        country = !request.location.country.nil? && !request.location.country.blank? ? request.location.country : location['country']
        state = location['region']
        Analytic.insert_update_analytic_data(link.id,ip,city,country,state)
    end

    def fetch_location_by_ip(ip)
        begin
          uri = URI.parse('https://ipinfo.io/'+ip)
          
          header = {'Content-Type': 'application/json'}
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
          request = Net::HTTP::Get.new(uri.request_uri,{'Content-Type' =>'application/json'})
         
          
          # Send the request
          response = http.request(request)
          body = JSON.parse(response.body)
          return body
        rescue => e
            puts "failed #{e}"
        end
    end

end
