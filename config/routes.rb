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

  # 問い合わせ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  
  # フォロー機能
  resources :users do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
end

# ランキングページ
get 'post/ranking' => 'posts#ranking'
# サーチ機能
get '/search' => 'searchs#search'

# 退会機能
get 'user/unsubscribe' => 'users#unsubscribe'
put "/users/:id/withdraw" => "users#withdraw", as: 'users_withdraw'




end
