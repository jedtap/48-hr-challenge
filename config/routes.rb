Rails.application.routes.draw do
  resources :posts
  resources :groups
  root 'pages#login'
end
