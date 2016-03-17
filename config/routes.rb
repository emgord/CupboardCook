Rails.application.routes.draw do
  root to: "user_ingredients#index"
  get "/auth/:provider/callback" => "sessions#create"
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  get '/recipes' => 'recipes#index'
  get '/ingredients/search' => 'ingredients#search', as: :ingredient_search
  post '/recipes/find_recipes' => 'recipes#find_recipes'
  get '/health', to: 'users#health'
  get "/.well-known/acme-challenge/#{ENV['LE_AUTH_REQUEST']}", to: 'users#letsencrypt'
  resources :user_ingredients, only: [:index, :create, :destroy]
  resources :user_recipes, only: [:create, :destroy]
end
