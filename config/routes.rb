Rails.application.routes.draw do

  devise_for :users
  root "homes#top"
  get '/about' => "homes#about"
  resources :posts
  resources :users
end
