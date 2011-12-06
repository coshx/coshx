Coshx::Application.routes.draw do

  devise_for :admins
  
  match 'dashboard' => 'dashboard#index', :as => :admin_root

  resources :posts, :path => "/blog" do
    put 'publish', :on => :member
  end

  match '/services' => 'home#services', :as => :services
  match '/portfolio' => 'home#portfolio', :as => :portfolio
  match '/about' => 'home#about', :as => :about
  root :to => 'home#index'
end
