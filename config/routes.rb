Rails.application.routes.draw do
  
  root :to => "pages#form"

  scope "/pages" do
    get "/result", to: "pages#results"
    get "/user_not_found", to: "pages#user_not_found"
    get "/register_new_user", to: "pages#register_new_user"
  end

  scope "/incomming" do
    post "form-data", to: "incomming#form_submit"
  end

  resources :locations
  
  resources :users do
    post "/register", to: "users#register_new_user"
  end
end
