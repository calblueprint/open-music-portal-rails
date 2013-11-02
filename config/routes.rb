USOMC::Application.routes.draw do
  root to: 'static_pages#home'

  resources :users, only: [:create, :destroy, :show]
  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]

  match 'profile', to: 'users#my_profile', via: :get
  match 'registration', to: 'users#new', via: :get
  match 'about', to: 'static_pages#about', via: :get
  match 'competition', to: 'static_pages#competition', via: :get
  match 'winners', to: 'static_pages#winners', via: :get
  match 'judges', to: 'static_pages#judges', via: :get
  match 'support', to: 'static_pages#support', via: :get

  match 'pieces/typeahead_search', to: 'pieces#typeahead_search', via: :get
  resources :pieces

  match 'admin/dashboard', to: 'admins#show', via: :get
  match 'admin/users', to: 'admins#users' , via: :get

  resources :rooms

  # API for the iPad app.
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match 'users/index', to: 'users#index', via: :get
      match 'rooms/index', to: 'rooms#index', via: :get
    end
  end
end
