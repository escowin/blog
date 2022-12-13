Rails.application.routes.draw do
  root "articles#index" # root maps to index

  get "/articles", to: "articles#index" # GET route maps to ArticlesController index action

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
