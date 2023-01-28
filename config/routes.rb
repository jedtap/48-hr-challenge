Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :groups
  root 'pages#login'
end
