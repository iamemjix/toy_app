Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
  get "sign_up", to: "registration#new_user"
  post "sign_up", to: "registration#create"

end
