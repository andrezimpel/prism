Rails.application.routes.draw do

    # signup
    get "/signup" => "accounts#new", as: "signup"
    get "/accounts/new" => redirect("/signup")


  # blog routes
  # get "/blog/:year/:month/:day/:title" => "posts#show", as: "frontend_blog_post"


  # resources :posts, path: "blog"

  # resources :profiles
  # resources :photos

  # resources :galleries do
  #   resources :photos
  # end


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

  root to: redirect("/signup")

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
