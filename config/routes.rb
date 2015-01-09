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
  get 'about' => 'pages#about'
  get 'approach' => 'pages#approach'
  get 'careers' => 'pages#careers'
  get 'contact' => 'pages#contact_us'
  get 'competition' => 'pages#competition'

  post 'uploads/images' => 'posts#upload_image'

  devise_for :admins
  get 'edit_my_profile' => 'admins#edit'
  match 'profile_update' => 'admins#update'

  get 'profile/:slug' => "pages#profile"
  get 'dashboard' => 'dashboard#welcome', :as => :admin_root
  get '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }

  resources :posts, :except => [:welcome, :destroy] do
    put 'publish', :on => :member
  end

  resources :jobs, :path => "/careers", :except => :destroy do
    put 'publish', :on => :member
  end

  get '/services' => 'pages#services', :as => :services

  # mount Contenteditable::Engine => "/contenteditable"

  # get '/competition' => 'pages#competition'
  match '/' => 'pages#competition', :constraints => { :subdomain => 'competition' }

  root :to => 'pages#welcome'

  match '/404', :to => 'errors#not_found'

  get '/robots.txt' => 'pages#robots'

end
