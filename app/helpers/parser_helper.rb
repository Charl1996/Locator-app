module ParserHelper

  include GeonamesHelper

  def get_location_data(data)
    geo_hash = GeonamesHelper.get_lon_lat(data[:location])

    {
      timestamp: data[:timestamp],
      location: {
        lon: geo_hash[:lon],
        lat: geo_hash[:lat]
      }
    }
  end
end
