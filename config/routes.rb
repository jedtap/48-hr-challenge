Rails.application.routes.draw do
  resources :groups
  root 'pages#login'
end
