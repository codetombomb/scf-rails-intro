Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/books', to: "books#index"
  # post '/books', to: "books#create"
  # get '/books/:id', to: "books#show"

  resources :books
end
