class Geocoder
  API_KEY = ENV['GOOGLE_API_KEY']
  class << self
    # accepts address data
    # <return> OpenStruct.new{lat: lat, lng: lng, accuracy: 1}
    def geocode(address_string = nil)
      response = RestClient.get(request_url(address_string))
      parse_response_for_coords(response)
    rescue RestClient::ExceptionWithResponse => e
      puts "[#{self.class}] There was an error geocoding, \naddress: #{address_string} \n #{e.message}"
    end

    private

    def request_url(string)
      "https://maps.googleapis.com/maps/api/geocode/json?address=#{string}&key=#{API_KEY}"
    end

    def parse_response_for_coords(response)
      response_body = { accuracy: 0 }
      if response.code == 200
        response_body = JSON.parse(response.body).fetch('results', []).first&.dig('geometry', 'location')
        response_body[:accuracy] = 1 # required for geocodio threshold, but google has no accuracy response
      end
      OpenStruct.new(response_body)
    end
  end
end
