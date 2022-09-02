Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'weddings', to: 'users/registrations#new_wedding'
    post 'weddings', to: 'users/registrations#create_wedding'
    root to: "devise/registrations#new"
  end

  resources :users do
    resources :posts, only: [:new, :create]
    resources :communities, only: [:index, :create]
    resources :weddings, only: [:index, :edit, :update, :show]
  end

  
end
