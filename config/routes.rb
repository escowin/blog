Rails.application.routes.draw do
  root "articles#index" # root maps to index

  # CRUD entity
  resources :articles do
    resources :comments
  end
end
