Rails.application.routes.draw do
  resources :votes
  devise_for :users
  resources :restaurants, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'
  put '/restaurant/:id/splitVote', to: 'restaurants#splitVote', as: 'splitVote'
  put '/restaurant/:id/noSplitVote', to: 'restaurants#voteNoSplit', as: 'voteNoSplit'
  get 'search', to: 'restaurants#search'
end
