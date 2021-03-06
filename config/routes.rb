Rails.application.routes.draw do
  resources :favorites, except: [:index, :new, :create, :destroy]
  resources :comments, except: [:index, :new, :create, :destroy]
  resources :votes
  devise_for :users
  resources :restaurants, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'
  put '/restaurant/:id/splitVote', to: 'restaurants#splitVote', as: 'splitVote'
  put '/restaurant/:id/noSplitVote', to: 'restaurants#voteNoSplit', as: 'voteNoSplit'
  get 'search', to: 'restaurants#search'
  get 'restaurants/:id/newComment', to: 'restaurants#newComment'
  post "restaurants/:id/newComment", to: "restaurants#newComment", as: "restaurants_new_comment"
  post "restaurants/:id/comment", to: 'restaurants#addComment', as: 'restaurants_add_comment'
  post "restaurants/:id/favorite", to: 'restaurants#addFavorite', as: 'restaurants_add_favorite'
  post "restaurants/:id/removeFavorite", to: 'restaurants#removeFavorite', as: 'restaurants_remove_favorite'
  get "users/:id", to: 'users#show', as: "users_show"
end
