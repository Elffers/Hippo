Hippo::Application.routes.draw do

  resources :users
 
  get "users/:id/orders/:product_id" => "users#orders", as: :user_orders

  resources :products do 
    resources :category_products
    resources :reviews, only: [:new, :create, :index]
  end
  resources :reviews, except: [:new, :create, :index]
#This section is probably duplicating things stuff might break, fix this
  get 'products/:id' => "products#show"

  get '/products/:id/edit' => "products#edit"
  get "products/new" => 'products#new'

  patch "/products/:id/edit" => "products#update"
#End of potential problems

  get "/categories" => "categories#index"
  get "/categories/new" => "categories#new"
  post "/categories" => "categories#create"
  get "/categories/:id" => "categories#show", as: :category


  get "/sign-up" => "users#new", as: :sign_up
  # post "/sign-up" => "users#create", as: :sign_up
  # resources :sessions

  get "/sign-in" => "sessions#new", as: :sign_in
  post "/sign-in" => "sessions#create", as: :signing_in
  get "/sign-out" => "sessions#destroy", as: :sign_out

  post "/orders/:id/add_product/:product_id" => "orders#add_product", as: :add_product
  get "orders/:id" => "orders#show", as: :order
  delete '/orders/:id/remove_product/:product_id' => "orders#remove_product", as: :remove_product
  patch '/orders/:id/update_quantity/:product_id' => "orders#update_quantity", as: :update_quantity

  get "/search" => "search#show"
  
  #get "/reviews/:id" => "reviews#show"

  get "/checkout"     => "orders#checkout", as: :checkout
  post "/checkout"    => "orders#submit", as: :pay

  root 'welcome#index'
end
