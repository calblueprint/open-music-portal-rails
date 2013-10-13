USOMC::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root :to => 'static_pages#home'
  match 'profile', to: 'static_pages#profile', via: :get
  match 'registration', to: 'static_pages#registration', via: :get
  match 'pieces/typeahead_search', to: 'pieces#typeahead_search', via: :get

  resources :pieces
  match 'users/new', to: 'users#new', via: :get
  match 'pieces', to: 'pieces#index', via: :get
  match '/signup', to: 'users#new', via: :get
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match 'users/index', to: 'users#index', via: :get
    end
  end
end
