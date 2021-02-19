class User < ApplicationRecord
  has_many :locations

  def update_current_location(location_info)
    self.locations.create(
      name: location_info[:name], 
      lon: location_info[:location][:lon],
      lat: location_info[:location][:lat],
      reported_at: location_info[:timestamp]
    )
  end

  def get_last_location()
    location = self.locations.last
    {
      name: location.name,
      timestamp: location.reported_at
    }
  end

end
