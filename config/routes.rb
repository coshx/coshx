Coshx::Application.routes.draw do

  # coshx.com#{x} redirects to www.coshx.com#{x}
  match '(*any)' => redirect { |p, req|
    req.url.sub(req.host, 'www.coshx.com') },
    :constraints => { :host => /^coshx\.com$/ }

  resources :contents
  resources :messages
  resources :quotes
  resources :projects

  scope "/blog" do
    get '(/author/:author_slug)'   => 'posts#index', :as => :by_author
    get ':year/:month/:day/:title' => 'posts#show',  :as => :show_post
    get '(/:year(/:month(/:day)))' => 'posts#index', :as => :blog_posts
  end

  get 'get_random_quote' => 'quotes#get_random_quote'
  get 'generate_slugs' => 'admins#generate_slugs'
  get 'thank_you' => 'messages#thank_you'
  get 'about' => 'home#about'
  get 'approach' => 'home#approach'
  get 'careers' => 'home#careers'
  get 'contact' => 'home#contact_us'
  get 'competition' => 'home#competition'

  post 'uploads/images' => 'posts#upload_image'

  devise_for :admins

  #admins urls
  get 'edit_my_profile' => 'admins#edit'
  match 'profile_update' => 'admins#update'

  get 'profile/:slug' => "home#profile"
  get 'dashboard' => 'dashboard#index', :as => :admin_root
  get '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }



  resources :posts, :except => [:index, :destroy] do
    put 'publish', :on => :member
  end

  resources :jobs, :path => "/careers", :except => :destroy do
    put 'publish', :on => :member
  end

  get '/services' => 'home#services', :as => :services

  # mount Contenteditable::Engine => "/contenteditable"

  # get '/competition' => 'home#competition'
  match '/' => 'home#competition', :constraints => { :subdomain => 'competition' }  

  root :to => 'home#index'

  match '/404', :to => 'errors#not_found'

  # robot requests to rails server ok when cached
  get '/robots.txt' => 'home#robots'

end
