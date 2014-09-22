Rails.application.routes.draw do

  # signup
  get "/signup" => "accounts#new", as: "signup"
  get "/accounts/new" => redirect("/signup")

  # backend
  scope ":account_id" do
    resources :accounts, controller: "backend/accounts"
    resources :clients, controller: "backend/clients"
    # invite a client
    get "/clients/:id/invite" => 'backend/clients#invite', controller: "backend/clients", as: "invite_client"

    resources :posts, path: "blog", controller: "backend/posts"

    resources :galleries, controller: "backend/galleries" do
      resources :photos, controller: "backend/photos"
    end
    resources :photos, controller: "backend/photos"

    # invitation
    devise_scope :user do
      get "team/invite", to: "users/invitations#new", :as => "new_account_user_invitation"
      post "team/invite", to: "users/invitations#create"
    end

    # update user settings
    get "/update-settings/:resource/:key/:value" => 'users#update_settings', as: "update_user_settings"
  end
  get "/:account_id/galleries" => "galleries#index", as: "prism_root"



  # --------------------------------------



  # account frontend
  scope :constraints => lambda { |request| !Subdomain.match(request) } do
    # portfolio
    resources :galleries, path: "portfolio", as: "portfolio" do
      resources :photos
    end

    # blog routes
    resources :posts, path: "blog", as: "blog"
    get "/blog/:year/:month/:day/:title" => "posts#show", as: "frontend_blog_post"

    # root
    get "/" => redirect("/portfolio"), as: "frontend_root"
  end



  # --------------------------------------



  # users, clients & accounts
  resources :accounts
  devise_for :clients
  devise_for :users,
              #:controllers => { :invitations => 'users/invitations', :registrations => "users/registrations", :sessions => "users/sessions" },
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
    # account = Account.where(subdomain: r.subdomain)
    # if !account.empty?
    #   return true
    # end
    #
    # return false
  end

  def self.not_match(r)
    r.subdomain != "www" || r.subdomain != ""
  end
end
