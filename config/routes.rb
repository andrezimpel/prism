Rails.application.routes.draw do
  resources :addresses

  resources :order_transactions

  # signup
  get "/signup" => "accounts#new", as: "signup"
  get "/accounts/new" => redirect("/signup")





  # shop
  scope "/shop" do
    resources :galleries, controller: "clients/galleries", as: "shop_galleries"
    resources :shopping_carts, controller: "clients/shopping_carts", path: "shoppingcart" do
      resources :shopping_cart_items, controller: "clients/shopping_cart_items", path: "items"
    end
    resources :shopping_cart_items, controller: "clients/shopping_cart_items", path: "items"
    resources :orders, controller: "clients/orders", as: "shop_orders"
    get "/shoppingcart/:id/clear" => "clients/shopping_carts#clear", as: "clear_shoppping_cart"
  end





  # backend
  scope ":account_id" do
    resources :accounts, controller: "backend/accounts"
    resources :clients, controller: "backend/clients"
    # invite a client
    get "/clients/:id/invite" => 'backend/clients#invite', controller: "backend/clients", as: "invite_client"

    resources :posts, path: "blog", controller: "backend/posts"
    resources :photo_sizes, controller: "backend/photo_sizes", path: "photo-sizes"

    resources :galleries, controller: "backend/galleries" do
      resources :photos, controller: "backend/photos"
    end
    resources :photos, controller: "backend/photos"

    resources :orders, controller: "backend/orders"

    # invitation
    devise_scope :user do
      get "team/invite", to: "users/invitations#new", :as => "new_account_user_invitation"
      post "team/invite", to: "users/invitations#create"
    end

    # update user settings
    get "/update-settings/:resource/:key/:value" => 'users#update_settings', as: "update_user_settings"
  end
  get "/:account_id/galleries" => "galleries#index", as: "prism_root"





  # frontend
  scope :constraints => lambda { |request| !Subdomain.match(request) } do
    # portfolio
    # resources :galleries, path: "portfolio", as: "portfolio" do
      # resources :photos
    # end

    # blog routes
    # resources :posts, path: "blog", as: "blog"
    # get "/blog/:year/:month/:day/:title" => "posts#show", as: "frontend_blog_post"


    as :client do
      get "/signin" => "devise/sessions#new"
      get "/login" => redirect("signin")
      delete "/logout" => "devise/sessions#destroy"
    end

    devise_for :clients,
                :path => "",
                :path_names => {:sign_in => 'login', :sign_up => "signup", :sign_out => 'logout'}

    # --------------------------------------


    # root
    # get "/" => redirect("/portfolio"), as: "frontend_root"
    get "/welcome" => 'comingsoon/frontend#index', as: "frontend_root"
    get '*path' => redirect("/welcome")
    get '/' => redirect("/welcome")
  end





  # users & accounts
  resources :accounts
  devise_for :users,
             # :controllers => { :invitations => 'users/invitations', :registrations => "users/registrations", :sessions => "users/sessions" },
             :path => "",
             :path_names => {:sign_in => 'login', :sign_up => "signup", :sign_out => 'logout'}

  as :user do
    get "/login" => "devise/sessions#new", as: "user_login"
    get "/signin" => redirect("login")
    delete "/logout" => "devise/sessions#destroy"
  end

  get "/:account_id" => redirect("/")





  # root 'galleries#index'
  root to: redirect("/signup")

end

# ----------------------------------------

# helper
class Subdomain

  def self.match(r)
    r.subdomain == "www" || r.subdomain == ""
  end

  def self.not_match(r)
    r.subdomain != "www" || r.subdomain != ""
  end
end
