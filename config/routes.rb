TeamRocket::Application.routes.draw do
  resources :posts
  devise_for :users #, :controllers => { :sessions => "users/sessions" } 

  get "home/index"
  get "/members/" => "members#index"
  get "/members/index" => "members#index"
  get "/posts/show" => "posts#index"


  root :to => "posts#index"
end
