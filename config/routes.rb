Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  put '/restaurant/:id/splitVote', to: 'restaurants#splitVote', as: 'splitVote'
  put '/restaurant/:id/noSplitVote', to: 'restaurants#voteNoSplit', as: 'voteNoSplit'
  get 'search', to: 'restaurants#search'
end
