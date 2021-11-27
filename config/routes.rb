Rails.application.routes.draw do
  root "homes#top"

  namespace :users do
    get 'sessions/new_guest'
  end

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root "homes#top"
  get '/about' => "homes#about"
  get '/profile' => "homes#profile"

  resources :posts do
    resource :post_selects, only: [:create, :destroy, :update]
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    get 'post_selects/show_a' => 'post_selects#show_a'
    get 'post_selects/show_b' => 'post_selects#show_b'
  end

  # 問い合わせ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'thanks', to: 'contacts#thanks', as: 'thanks'

  # フォロー機能
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'favorite_show' => 'favorites#show'
  end

  # ランキング機能
  resources :users
  get 'post/ranking' => 'posts#ranking'

  # サーチ機能
  get '/search' => 'searchs#search'

  # 退会機能
  get 'user/unsubscribe' => 'users#unsubscribe'
  put "/users/:id/withdraw" => "users#withdraw", as: 'users_withdraw'
end
