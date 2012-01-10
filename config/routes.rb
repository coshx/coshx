Coshx::Application.routes.draw do

  # eg www.coshx.com redirects to coshx.com
  #   http://stackoverflow.com/a/7352878/283398
  match '(*any)' => redirect { |p, req| req.url.sub('www.', '') }, :constraints => { :host => /^www\./ }

  devise_for :admins

  match 'dashboard' => 'dashboard#index', :as => :admin_root
  match '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }

  scope "/blog" do
    get ':year/:month/:day/:title' => 'posts#show',  :as => :show_post
    get '(/:year(/:month(/:day)))' => 'posts#index', :as => :blog_posts
  end

  resources :posts, :except => :index do
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
