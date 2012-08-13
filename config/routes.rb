Coshx::Application.routes.draw do

  resources :contents

  resources :messages

  resources :clients

  resources :quotes

  resources :projects

  #resources :posts
  match 'content_update' => 'contents#content_update'
  
  get 'get_random_quote' => 'quotes#get_random_quote'
  get 'generate_slugs' => 'admins#generate_slugs'
  get 'thank_you' => 'messages#thank_you'
  
  get 'contact' => 'home#contact_us'

  # eg www.coshx.com redirects to coshx.com
  #   http://stackoverflow.com/a/7352878/283398
  match '(*any)' => redirect { |p, req| req.url.sub('www.', '') }, :constraints => { :host => /^www\./ }

  devise_for :admins

  #admins urls
  get 'edit_my_profile' => 'admins#edit'
  match 'profile_update' => 'admins#update'
  
  get 'profile/:slug' => "home#profile"
  get 'dashboard' => 'dashboard#index', :as => :admin_root
  get '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }

  scope "/blog" do
    get ':year/:month/:day/:title' => 'posts#show',  :as => :show_post
    get '(/:year(/:month(/:day)))' => 'posts#index', :as => :blog_posts
  end

  resources :posts, :except => [:index, :destroy] do
    put 'publish', :on => :member
  end

  resources :jobs, :path => "/careers", :except => :destroy do
    put 'publish', :on => :member
  end

  get '/services' => 'home#services', :as => :services
  get '/portfolio' => 'home#portfolio', :as => :portfolio
  get '/about' => 'home#about', :as => :about
  root :to => 'home#index'
end
