Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'weddings', to: 'users/registrations#new_wedding'
    post 'weddings', to: 'users/registrations#create_wedding'
  end
  root to: "posts#index"
end
