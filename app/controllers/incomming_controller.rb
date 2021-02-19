class IncommingController < ApplicationController
  skip_before_action :verify_authenticity_token  

  include LocationHelper

  def form_submit
    data = form_data 
    user = User.find_by(email: data[:email])

    if user
      response = get_location_data(ensure_timestamp(data))
      puts "#{response}"
      user.update_current_location(response)

      redirect_to controller: "pages", action: "user_locations", id: user.id
    else
      redirect_to controller: "pages", action: "user_not_found", email: data[:email]
    end
  end

  private 

  def ensure_timestamp(data)
    if !data.has_key?(:timestamp)
      data[:timestamp] = DateTime.now
      data
    else
      data
    end
  end

  def form_data
    params.permit(:email, :location, :timestamp)
  end
end
