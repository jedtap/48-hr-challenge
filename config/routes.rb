Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :posts
  resources :groups

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
