class User < ApplicationRecord
  has_many :locations

  def update_current_location(location_info)
    self.locations.create(
      lon: location_info[:location][:lon],
      lon: location_info[:location][:lon],
      reported_at: DateTime.now
    )
  end
end
