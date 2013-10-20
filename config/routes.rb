USOMC::Application.routes.draw do
  root :to => 'static_pages#home'
  match 'profile', to: 'static_pages#profile', via: :get
  match 'registration', to: 'static_pages#registration', via: :get

  match 'pieces/typeahead_search', to: 'pieces#typeahead_search', via: :get
  resources :pieces

  match 'users/new', to: 'users#new', via: :get
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match 'users/index', to: 'users#index', via: :get
    end
  end
end
