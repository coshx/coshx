Coshx::Application.routes.draw do
  devise_for :admins
  
  match 'dashboard' => 'dashboard#index', :as => :admin_root

  resources :posts, :path => "/blog"
  get "/posts/*id" => 'posts#show', :as => :post, :constraints => {:id => %r[\d{4}/\d{2}/\d{2}/[^/]+]}
  match '/services' => 'home#services', :as => :services
  match '/portfolio' => 'home#portfolio', :as => :portfolio
  match '/about' => 'home#about', :as => :about
  root :to => 'home#index'
end
