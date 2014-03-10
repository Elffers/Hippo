Hippo::Application.routes.draw do

  resources :users
  get "users/:id/orders" => "users#orders", as: :user_orders
  post "users/:id/ship/:op_id" => "users#ship", as: :ship_order
  get "users/:id/pending" => "users#pending", as: :pending
  get "users/:id/completed" => "users#completed", as: :completed

  resources :products do
    resources :category_products
    resources :reviews, only: [:new, :create, :index]
  end

  resources :reviews, except: [:new, :create, :index]

  get "/categories", to: "categories#index"
  get "/categories/:id", to: "categories#show", as: :category
  get "/products/:product_id/categories/new",
      to: "categories#new",
      as: :new_category
  post "/products/:product_id/categories/new",
       to: "categories#create", as: :create_category
  get "/sign-up"  => "users#new", as: :sign_up
  post "/sign-up" => "users#create", as: :create_user

  get "/sign-in"  => "sessions#new", as: :sign_in
  post "/sign-in" => "sessions#create", as: :signing_in
  get "/sign-out" => "sessions#destroy", as: :sign_out
  post "/orders/:id/add_product/:product_id",
       to: "orders#add_product",
       as: :add_product
  get "orders/:id", to: "orders#show", as: :order # cart
  delete '/orders/:id/remove_product/:product_id',
         to: "orders#remove_product",
         as: :remove_product
  patch '/orders/:id/update_quantity/:product_id',
        to: "orders#update_quantity",
        as: :update_quantity
  # get 'orders/shipping', to: 'orders#shipping', as: :shipping
  get "/search"         => "search#show"
  get "/shipping", to: "orders#shipping", as: :shipping
  post "/checkout"       => "orders#checkout", as: :checkout
  post "/purchase_info" => "orders#start_purchase", as: :start_purchase
  post "/purchase_info" => "orders#complete_purchase", as: :complete_purchase
  root 'welcome#index'
end
