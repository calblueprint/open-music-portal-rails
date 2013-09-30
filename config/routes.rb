USOMC::Application.routes.draw do
  root :to => 'static_pages#home'
<<<<<<< HEAD
  match 'pieces', to: 'pieces#index', via: :get
  get "users/new"
=======
  match 'users/new', to: 'users#new', via: :get
>>>>>>> Fix style, remove unecessary stuff in route.rb
end
