TeamRocket::Application.routes.draw do
   resources :posts do
      collection do 
         get :archive 
         get :delete
         get :edit
      end
   end

   get "home/index"
   get "/members/" => "members#index"
   get "/members/index" => "members#index"
   get "/posts/archive" => "posts#archive"
   get "/members/edit" => "members#edit"
   get "/contact" => "pagehandle#contact"

   devise_for :users 
   root :to => "posts#index"
end
