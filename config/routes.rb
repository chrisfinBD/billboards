Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :billboards
  resources :songs
  resources :artists
  root to: "pages#index"
  get "/search", to: "searches#index"

end
