USOMC::Application.routes.draw do
  get "password_resets/new"
  root to: 'static_pages#home'

  resources :users, only: [:create, :destroy, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]
  resources :password_resets, only: [:new, :create, :edit, :update]

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
  resources :charges, only: [:new, :create]

  # API for the iPad app.
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match 'events/index', to: 'events#index', via: :get
      match 'events/:event_id/users', to: 'events#users', via: :get
      match 'events/:event_id/judge/:judge_id/contestant/:contestant_id/comment', to: 'events#post_comment', via: :post
      match 'events/:event_id/user/:user_id/ranking', to: 'events#post_ranking', via: :post
    end
  end
end
