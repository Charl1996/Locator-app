module GeonamesApiHelper

  def self.get_lon_lat(location_name)
    response = self.get_location_info(location_name)
    
    if response.has_value?(:ok)
      self.extract_lon_lat(response[:response])
    else
      response
    end
  end

  private

  def self.extract_lon_lat(response)
    guessed_response = response["geonames"].first
    
    {
      name: guessed_response["name"],
      lon: guessed_response["lng"],
      lat: guessed_response["lat"]
    }
  end

  def self.get_location_info(location_name)
    url = self.request_info()[:base_url]
    url = self.add_request(url)
    url = self.add_query_params(url, location_name)

    RequestHelper.get(url)
  end

  def self.get_request(url)
    Net::HTTP.get(URI(url))
  end

  def self.add_request(url)
    "#{url}/searchJSON"
  end

  def self.add_query_params(url, location_name)
    url = "#{url}?style=full"
    url = self.max_rows(url, self.request_info()[:max_rows])
    url = self.add_location_name(url, location_name)

    self.add_username(url, self.request_info()[:username])
  end

  def self.max_rows(url, max_rows)
    "#{url}&maxRows=#{max_rows}"
  end

  def self.add_location_name(url, location_name)
    "#{url}&name_startsWith=#{location_name.downcase}"
  end

  def self.add_username(url, username)
    "#{url}&username=#{username}"
  end

  def self.request_info()
    {
      base_url: "http://api.geonames.org",
      max_rows: 1,
      username: "dimagi", # add in env file
      password: "dimagi" # definitely add in env file
    }
  end

end
