Chatty::Application.routes.draw do
  root to: "bitcoin_addresses#index"
  get "setup_site" => "sessions#owner_setup_site", as: "owner_setup_site"

  scope 'api' do
    resources :bitcoin_addresses, only: [:index, :new, :create, :show]
  end
  resources :users, only: [:new, :create]
  resource :session 

  namespace :admin do 
    scope 'api' do 
      resources :bitcoin_addresses
      resources :payments do 
        get :refresh, on: :collection
      end
    end

    match "/dashboard", to: "dashboard#index"
    resource :site do
      get :setup_successful, on: :member
    end
    resources :users do 
      resource :check_password, only: [:new, :create]
    end
  end

  # Actions handy when developing
  if Chatty::Services.demo_mode?
    %w{blank_slate setup_site sign_in add_bitcoin_address add_payment}.each do |action|
      match "demo/#{action}" => "demo##{action}", as: "#{action}_demo"
    end
  end                 

  resource :messages do
    collection { get :events }
  end
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
