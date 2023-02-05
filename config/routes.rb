Rails.application.routes.draw do
  root "home#index" # root maps to index

  # CRUD entity
  resources :articles do
    resources :comments
  end
end
