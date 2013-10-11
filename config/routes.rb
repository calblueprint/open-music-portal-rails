USOMC::Application.routes.draw do
  root :to => 'static_pages#home'
  root :to => 'static_pages#profile'
  root :to => 'static_pages#registration'
  match 'pieces', to: 'pieces#index', via: :get
  match 'users/new', to: 'users#new', via: :get
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match 'users/index', to: 'users#index', via: :get
    end
  end
end
