Rails.application.routes.draw do

  get 'posts/index'
  get 'users/show'
  devise_for :users
  root "homes#top"
  get '/about' => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
