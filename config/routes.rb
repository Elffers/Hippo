Hippo::Application.routes.draw do

  resources :users
  get "users/:id/orders" => "users#orders", as: :user_orders
  post "users/:id/orders" => "users#ship", as: :ship_order 
  
  resources :products do 
    resources :category_products
    resources :reviews, only: [:new, :create, :index]
  end

  resources :reviews, except: [:new, :create, :index]

  get "/categories"                           => "categories#index"
  get "/categories/:id"                       => "categories#show", as: :category
  get "/products/:product_id/categories/new"  => "categories#new", as: :new_category
  post "/products/:product_id/categories/new" => "categories#create", as: :create_category
 
  get "/sign-up"  => "users#new", as: :sign_up
  post "/sign-up" => "users#create", as: :create_user

  get "/sign-in"  => "sessions#new", as: :sign_in
  post "/sign-in" => "sessions#create", as: :signing_in
  get "/sign-out" => "sessions#destroy", as: :sign_out
  

  post "/orders/:id/add_product/:product_id"      => "orders#add_product", as: :add_product
  get "orders/:id"                                => "orders#show", as: :order
  delete '/orders/:id/remove_product/:product_id' => "orders#remove_product", as: :remove_product
  patch '/orders/:id/update_quantity/:product_id' => "orders#update_quantity", as: :update_quantity

  get "/search"       => "search#show"

  get "/checkout"     => "orders#checkout", as: :checkout
  post "/purchase_info" => "orders#complete_purchase", as: :complete_purchase
  
  root 'welcome#index'
end
