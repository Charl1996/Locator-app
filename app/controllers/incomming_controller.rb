class IncommingController < ApplicationController
  skip_before_action :verify_authenticity_token  

  include ParserHelper

  def form_submit
    data = form_data 
    user = User.find_by(email: data[:email])

    if user
      response = get_location_data(data)
      user.update_current_location(response)

      redirect_to controller: "pages", action: "results", results: response
    else
      redirect_to controller: "pages", action: "user_not_found", email: data[:email]
    end
  end

  private 

  def form_data
    params.permit(:email, :location, :timestamp)
  end
end
