USOMC::Application.routes.draw do
  root :to => 'static_pages#home'
  match 'pieces', to: 'pieces#index', via: :get
  get "users/new"
end
