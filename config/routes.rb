Rails.application.routes.draw do
  resources :replies
  resources :memberships
  resources :comments
  resources :posts

  resources :groups do
    collection do
      post :filter
    end
  end

  # Devise Routes
  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
