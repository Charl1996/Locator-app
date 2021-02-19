Rails.application.routes.draw do
  
  root :to => "pages#form"

  scope "/pages" do
    get "/user_locations", to: "pages#user_locations"
    get "/user_not_found", to: "pages#user_not_found"
    get "/register_new_user", to: "pages#register_new_user"
    get "/track_user", to: "pages#track_user"
    get "/user_location", to: "pages#user_location"
  end

  scope "/incomming" do
    post "form-data", to: "incomming#form_submit"
  end

  resources :locations
  
  scope "/users" do
    post "/register", to: "users#register_new_user"
    get "/find_user_location", to: "users#find_user_location"
  end
end
