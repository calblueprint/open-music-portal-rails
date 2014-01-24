USOMC::Application.routes.draw do
  root to: 'static_pages#home'

  get "password_resets/new"
  get "confirmations/new"
  get 'confirmed/:id', to: 'confirmations#update', as: 'confirmed'

  resources :users, except: [:new, :destroy, :index]
  match 'users/add_display_event/:display_event_id', to: 'users#add_display_event', via: :get
  match 'login', to: 'sessions#new', via: :get
  match 'login', to: 'sessions#create', via: :post
  match 'logout', to: 'sessions#destroy', via: [:get, :delete]
  resources :password_resets, only: [:new, :create, :edit, :update]

  match 'profile', to: 'users#my_profile', via: :get

  match 'registration', to: 'users#new', via: :get
  match 'registration', to: 'users#create', via: :post

  match 'overview', to: 'static_pages#overview', via: :get
  match 'location', to: 'static_pages#competition', via: :get
  match 'winners', to: 'static_pages#winners', via: :get
  match 'judges', to: 'static_pages#judges', via: :get
  match 'support', to: 'static_pages#support', via: :get

  # Extra static pages
  match 'scholarships', to: 'static_pages#scholarships', via: :get
  match 'adjundicator-program', to: 'static_pages#adjundicator_program', as: 'adjundicator_program', via: :get
  match 'donor-levels', to: 'static_pages#donor_levels', as: 'donor_levels', via: :get
  match 'sponsorship-levels', to: 'static_pages#sponsorship_levels', as: 'sponsorship_levels', via: :get
  match 'current-sponsors', to: 'static_pages#current_sponsors', as: 'current_sponsors', via: :get
  match 'donations', to: 'static_pages#donations', via: :get
  match 'volunteer', to: 'static_pages#volunteer', via: :get
  match 'advertise', to: 'static_pages#advertise', via: :get
  match 'history', to: 'static_pages#history', via: :get
  match 'board-members', to: 'static_pages#board_members', as: 'board_members', via: :get
  match 'staff-members', to: 'static_pages#staff_members', as: 'staff_members', via: :get
  match 'contact', to: 'static_pages#contact', via: :get

  match 'pieces/typeahead_search', to: 'pieces#typeahead_search', via: :get

  # Charges and transactions
  match 'checkout', to: 'charges#new', via: :get
  match 'checkout', to: 'charges#create', via: :post

  resources :competitions, only: [:index, :show] do
    match 'schedule', to: 'competitions#schedule', as: 'schedule', via: :get
    match 'schedule/days/:day_id', to: 'competitions#day', as: 'day', via: :get
    resources :categories, only: [:show] do
      resources :display_events, path: 'events', only: [:show]
    end
  end

  # Admin
  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get
    match 'users/search', to: 'users#search', via: :get
    resources :users
    resources :competitions
    resources :display_events, path: 'events', only: [:new, :edit, :update]
    match 'events/search', to: 'events#search', via: :get
    resources :events, only: [:show, :index] do
      match 'contestants/:contestant_id', to: 'events#show_comments', as: 'show_comments', via: :get
    end
    resources :categories
    resources :pieces

    namespace :stats do
      match '/', to: redirect('/admin/stats/dashboard'), via: :get
      match 'dashboard', to: 'pages#dashboard', via: :get
    end
  end

  # API for the iPad app.
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match 'login', to: 'sessions#login', via: :post

      match 'events/index', to: 'events#index', via: :get
      match 'events/:event_id', to: 'events#show', via: :get
      match 'events/:event_id/users', to: 'events#users', via: :get
      match 'events/:event_id/judge/:judge_id/contestant/:contestant_id/comment', to: 'events#post_comment', via: :post
      match 'events/:event_id/judge/:judge_id/contestant/:contestant_id/comments', to: 'events#comments', via: :get
      match 'events/:event_id/rankings', to: 'events#post_ranking', via: :post
      match 'events/:event_id/rankings', to: 'events#rankings', via: :get
    end
  end
end
