Rails.application.routes.draw do

  root 'static_pages#home'

  get 'sessions/new'

  get 'static_pages/home'
  get 'static_pages/help'

  resources :albums
  get 'albums/new/:p/:k', to: 'albums#new'
  delete 'your_top_5/:id', to: 'albums#destroy'

  resources :search, only: :search
  get 'search', to: 'search#search'
  get 'search/:p', to: 'search#search'

  resources :album_collections
  put 'your_top_5/position/:p/album/:a/', to: 'albums#create'
  get 'your_top_5/position/:p/album/:a/', to: 'album_collections#show'
  get 'your_top_5', to: 'album_collections#show'

  resources :users
  get 'profile', to: 'users#show', as: :show
  get 'register', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

end
