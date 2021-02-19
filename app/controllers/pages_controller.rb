class PagesController < ApplicationController

  def form
  end

  def user_locations
     @user_locations = find_user.locations
  end

  def register_new_user
  end

  def track_user
  end

  def user_location
    @user_location = params.fetch(:location)
  end

  private

  def find_user
    User.find_by(id: params.fetch(:id))
  end
end
