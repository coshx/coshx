Coshx::Application.routes.draw do

  # coshx.com#{x} redirects to www.coshx.com#{x}
  match '(*any)' => redirect { |p, req|
    req.url.sub(req.host, 'www.coshx.com') },
    :constraints => { :host => /^coshx\.com$/ }

  resources :contents
  resources :messages
  resources :quotes
  resources :projects

  get 'get_random_quote' => 'quotes#get_random_quote'
  get 'generate_slugs' => 'admins#generate_slugs'
  get 'thank_you' => 'messages#thank_you'
  get 'about' => 'home#about'
  get 'contact' => 'home#contact_us'
  get 'closeoutbikes_case_study' => 'home#closeoutbikes_case_study'
  get 'mobilizeart_case_study' => 'home#mobilizeart_case_study'
  get 'gigdog_case_study' => 'home#gigdog_case_study'
  get 'textus_case_study' => 'home#textus_case_study'
  get 'greeneggs_case_study' => 'home#greeneggs_case_study'
  get 'scheduleshare_case_study' => 'home#scheduleshare_case_study'

  get 'case_study' => 'home#textus_case_study'

  get ':title' => 'projects#show', :as => :show_project
  get ':title/edit' => 'projects#edit', :as => :edit_project



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

  mount Contenteditable::Engine => "/contenteditable"

  root :to => 'home#index'

  match '/404', :to => 'errors#not_found'
end
