Rails.application.routes.draw do
  root "homes#top"

  namespace :users do
    get 'sessions/new_guest'
  end
<<<<<<< HEAD

=======
  
>>>>>>> b8db9a3 (fix)
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
<<<<<<< HEAD

=======
  
  root "homes#top"
>>>>>>> b8db9a3 (fix)
  get '/about' => "homes#about"
  
  resources :posts do
    resource :post_selects, only: [:create, :destroy, :update]
    resources :comments, only: [:create, :destroy]
    resource :favorites, only:[:create, :destroy]
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
<<<<<<< HEAD

  # ランキングページ
=======
  
  resources :users
>>>>>>> b8db9a3 (fix)
  get 'post/ranking' => 'posts#ranking'
  # サーチ機能
  get '/search' => 'searchs#search'
<<<<<<< HEAD

  # 退会機能
  get 'user/unsubscribe' => 'users#unsubscribe'
  put "/users/:id/withdraw" => "users#withdraw", as: 'users_withdraw'



=======
  
>>>>>>> b8db9a3 (fix)
end
