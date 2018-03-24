Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'news#index'
  # get '/', to: 'news#index'
  get '/search', to: 'news#search'
  get '/account', to: 'users#account'
  

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'

  resources :users, only: [:show, :create]
  resource :session, only: [:create, :destroy]
  resources :bookmarks, only: [:index, :create, :destroy, :update]
end
