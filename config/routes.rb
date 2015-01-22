Coshx::Application.routes.draw do



  # coshx.com#{x} redirects to www.coshx.com#{x}
  get '(*any)' => redirect { |p, req|
    req.url.sub(req.host, 'www.coshx.com') },
    :constraints => { :host => /^coshx\.com$/ }

  resources :contents
  resources :messages
  resources :quotes
  resources :projects
  resources :images

  scope "/blog" do
    get '(/author/:author_slug)'   => 'posts#index', :as => :by_author
    get ':year/:month/:day/:title' => 'posts#show',  :as => :show_post
    get '(/:year(/:month(/:day)))' => 'posts#index', :as => :blog_posts
  end

  get 'get_random_quote' => 'quotes#get_random_quote'
  get 'generate_slugs' => 'admins#generate_slugs'
  get 'thank_you' => 'messages#thank_you'
  get 'about' => 'pages#about'
  get 'approach' => 'pages#approach'
  get 'careers' => 'pages#careers'
  get 'contact' => 'pages#contact_us'
  get 'competition' => 'pages#competition'
  get '/phpMyAdmin/scripts/setup.php' => 'errors#not_found'

  devise_for :admins
  get 'edit_my_profile' => 'admins#edit'
  get 'profile_update' => 'admins#update'

  devise_scope :admin do
    get 'login' => 'devise/sessions#new'
    get 'signin' => 'devise/sessions#new'
  end

  get 'profile/:slug' => "pages#profile"
  get '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }

  resources :posts, :except => [:index] do
    put 'publish', :on => :member
  end

  resources :jobs, :path => "/careers", :except => :destroy do
    put 'publish', :on => :member
  end

  get '/services' => 'pages#services', :as => :services

  # mount Contenteditable::Engine => "/contenteditable"

  # get '/competition' => 'pages#competition'
  get '/' => 'pages#competition', :constraints => { :subdomain => 'competition' }

  root :to => 'pages#welcome'

  get '/404', :to => 'errors#not_found'

  get '/robots.txt' => 'pages#robots'

end
