Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :posts
  resources :groups
  root 'pages#login'
end
