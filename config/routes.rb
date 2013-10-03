USOMC::Application.routes.draw do
  root :to => 'static_pages#home'
  match 'pieces', to: 'pieces#index', via: :get
  match 'users/new', to: 'users#new', via: :get
end
