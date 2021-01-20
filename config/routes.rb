Rails.application.routes.draw do
  resources :posts 
  resources :categories
  resources :cars
  resources :users do
    resources :cars
    resources :posts, only: [:index]
  end
  #resources :comments, only: [:new, :create, :destroy]
  root 'home#show'
  get '/auth/:provider/callback', to: "sessions#omniauth"
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  put '/post/:id/like' => 'posts#like', as: 'like'
  put '/post/:id/comment' => 'comments#create', as: 'comment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
