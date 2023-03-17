Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
  
  #user
  get "sign_up", to: "registration#new_user"
  post "sign_up", to: "registration#create"

  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"

  delete "logout", to: "session#destroy"

  #toy
  get "create_toy", to:"toy#new"
  post "create_toy", to:"toy#create"

  get "edit_toy/:id", to:"toy#edit", as: "edit_toy"
  patch "edit_toy/:id", to: "toy#update", as: "update_toy"

  get "toy_list", to:"toy#list"
  get "toy_view/:id", to:"toy#view", as: "toy_view"

  delete "toy_delete/:id", to: "toy#destroy", as: "toy_delete"

end
