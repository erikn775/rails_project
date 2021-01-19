Rails.application.routes.draw do
  resources :posts 
  resources :categories
  resources :cars
  resources :users do
    resources :cars
    resources :posts, only: [:index]
  end
  root 'home#show'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  put '/post/:id/like' => 'posts#like', as: 'like'
  put '/post/:id/comment' => 'posts#comment', as: 'comment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
