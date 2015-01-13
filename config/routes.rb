Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users

  resources :search, only: :search
  get 'search', to: 'search#search'
  get 'search/:p', to: 'search#search'
  get 'search/:p/album/:id', to: 'search#search'

  # User
  get 'profile', to: 'users#show', as: :show
  get 'register', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  # Album collection
  resources :album_collections do
    resources :albums
  end

  put 'your_top_5/position/:p/album/:a/', to: 'albums#create'
  put 'your_top_5/position/:p/change/:id/album/:a/', to: 'albums#update'
  get 'your_top_5/position/:p/album/:a/', to: 'album_collections#show'
  get 'your_top_5', to: 'album_collections#show'

  # Albums
  delete 'your_top_5/:id', to: 'albums#destroy'
  get 'albums/new/:p/:k', to: 'albums#new'
  resources :albums do
    put :sort, on: :collection
  end

end
