class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def register_new_user
    @user = User.new(user_params)

    if @user.save
      redirect_to controller: "pages", action: "form"
    else
      redirect_to controller: "pages", action: "form"
    end
  end 

  def find_user_location
    user = User.find_by(email: params.fetch(:email))

    if user
      redirect_to controller: "pages", action: "user_location", location: user.get_last_location()
    else
      redirect_to controller: "pages", action: "user_not_found", email: data[:email]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
