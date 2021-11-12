Rails.application.routes.draw do
  namespace :users do
    get 'sessions/new_guest'
  end
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "homes#top"
  get '/about' => "homes#about"
  resources :posts do
    resource :post_selects, only: [:create, :destroy, :update]
    resources :comments, only: [:create, :destroy]
  end
  resources :users
  get 'post/ranking' => 'posts#ranking'
  get '/search' => 'searchs#search'
end
