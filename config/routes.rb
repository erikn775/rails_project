Rails.application.routes.draw do
  resources :posts
  resources :categories
  resources :cars
  resources :users do
    resources :cars
  end
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
