Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "getdetails",to:"users#index"
  post "createuser", to:"users#create"
  get "showuser/:id", to:"users#show"
  put "updateuser/:id", to:"users#update"
  delete "deleteuser/:id", to:"users#destroy"
end
