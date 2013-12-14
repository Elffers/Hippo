Hippo::Application.routes.draw do
  get "orders/new"
  get "orders/index"
  get "welcome/index"
  resources :users
  resources :products
#This section is probably duplicating things stuff might break, fix this
  # get '/products'    => "products#index"
  get 'products/:id' => "products#show"

  # get '/products/new' => "products#new"
  get '/products/:id/edit' => "products#edit"
  # get '/products/create' => "products#create"
  # get '/products/destroy' => "products#destroy"
  # get '/products/put' => "products#update"
  # get '/products/:id' => "products#show"
  post "/products/:id/edit" => "products#update"
#End of potential problems
  get "/sign-up" => "users#new", as: :sign_up
  # post "/sign-up" => "users#create", as: :sign_up
  # resources :sessions

  
  get "/sign-in" => "sessions#new", as: :sign_in
  post "/sign-in" => "sessions#create", as: :signing_in
  get "/sign-out" => "sessions#destroy", as: :sign_out
<<<<<<< HEAD
  
  get "/orders/:id" => "orders#show"
  post "/orders/:id/add_product/:product_id" => "orders#add_product"
=======

  post "/orders/:id/add_product/:product_id" => "orders#add_product", as: :add_product
  get "orders/:id" => "orders#show"
>>>>>>> 923d250907ba1bb7a57f1a6c22eaaf06b3e548de

  get "/search" => "products#search"

  
  # get "users/create"  => "users#create"
  # post "users"        => "users#index"
  # get "users/update"  => "users#update"
  # get "users/edit"    => "users#edit"
  # get "users/destroy" => "users#destroy"
  # get "users/"        => "users#index"
  # get "users/:id"     => "users#show"
  
  #post is a thing that you are doing sometimes
  # Read about resources HOMEWORK


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
