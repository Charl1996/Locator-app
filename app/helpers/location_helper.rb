module LocationHelper

  include GeonamesApiHelper

  def get_location_data(data)
    geo_hash = GeonamesApiHelper.get_lon_lat(data[:location])

    {
      name: geo_hash[:name],
      timestamp: data[:timestamp],
      location: {
        lon: geo_hash[:lon],
        lat: geo_hash[:lat]
      }
    }
  end
end
