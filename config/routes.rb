Coshx::Application.routes.draw do

  devise_for :admins
  
  match 'dashboard' => 'dashboard#index', :as => :admin_root
  match '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }

  resources :posts, :path => "/blog" do
    put 'publish', :on => :member
  end

  resources :jobs, :path => "/careers" do
    put 'publish', :on => :member
  end

  match '/services' => 'home#services', :as => :services
  match '/portfolio' => 'home#portfolio', :as => :portfolio
  match '/about' => 'home#about', :as => :about
  root :to => 'home#index'
end
