USOMC::Application.routes.draw do
  get "password_resets/new"
  get "confirmations/new"
  get 'confirmed/:id', to: 'confirmations#update', as: 'confirmed'

  root to: 'static_pages#home'

  resources :users, except: [:new, :destroy, :index]
  match 'users/add_display_event/:display_event_id', to: 'users#add_display_event', via: :get
  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]
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

  #Temporary admin dashboard

  # Admin functionality
 # scope '/admin' do
  #  resources :pieces, except: [:update, :destroy]
  #  match '/', to: redirect('/admin/dashboard'), via: :get
 #   match 'dashboard', to: 'admins#show', via: :get
 #   match 'users', to: 'admins#users', as: 'admin_users', via: :get
  #  match 'users/:id/edit', to: 'admins#user_edit', as: 'admin_edit', via: :get
 #   match 'users/:id/update', to: 'admins#user_update', as: 'admin_update', via: :patch
 #   match 'judges', to: 'admins#judges', as: 'admin_judges', via: :get

   # resources :competitions, only: [:new, :create]
   # resources :display_events, path: 'events', except: [:destroy]
#  end

  namespace :admin do
    resources :page
    match 'dashboard', to: 'pages#dashboard', via: :get
    resources :users
  end

  resources :rooms, except: [:edit, :update, :destroy]
  resources :events, only: [:show, :index] do
    match 'contestants/:contestant_id', to: 'events#show_comments', as: 'show_comments', via: :get
  end
  resources :competitions, only: [:index, :show] do
    resources :categories, only: [:show] do
      resources :display_events, path: 'events', only: [:show]
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
