Rails.application.routes.draw do

  devise_for :users
  root "homes#top"
  get '/about' => "homes#about"
  resources :posts do
    resource :post_selects,only: [:create, :destroy,:update]
    resources :comments,only:[:create,:destroy]
  end
  resources :users

end
