Rails.application.routes.draw do
  resources :memberships
  devise_for :users
  resources :comments
  resources :posts
  
  resources :groups do
    collection do
      post :filter
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
