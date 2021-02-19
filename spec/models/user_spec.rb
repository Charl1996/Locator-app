require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "update_current_location" do
    it "updates successfully" do
      user = User.create(email: "test@demo.com", name: "Testy")

      expect(user.locations.count).to eq(0)

      location_hash = {
        name: "Where is this?",
        lon: "0",
        lat: "0"
      }

      user.update_current_location(location_hash)
      expect(user.locations.count).to eq(1)
      expect(user.locations.first.name).to eq("Where is this?")
    end

    it "does not have sufficient information" do
      # Todo
    end
  end

  describe "get_last_location" do
    it "gets last reported location successfully" do
      # Todo
    end
  end

end
