Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :posts do
    resources :comments
    get 'share'
    post 'share_to_users'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
