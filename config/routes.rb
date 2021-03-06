Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  match "/404" => "errors#four_oh_four", via: [ :get, :post, :patch, :delete ]

  devise_for :users, :path => "", :path_names => {:sign_in => "login", :sign_out => "logout"}

  namespace :admin do
    get '/' => 'dashboard#index'
    resources :users
    resources :releases
    resources :artists
    resources :mixes
    resources :events
  end

  resources :users

  resources :events
  resources :performances

  get 'coolroom/episode/:id' => 'events#show'
  get 'coolroom' => 'events#index'

  get 'coolroom/pilot' => 'events#episode1'
  get 'coolroom/episode1' => 'events#episode1'
  get 'coolroom/episode2' => 'events#episode2'
  get 'coolroom/episode3' => 'events#episode3'

  resources :artists do
    resources :releases
  end

  get 'releases/:id/:secret' => 'releases#show'
  get 'mixes/:id/:secret' => 'mixes#show'

  resources :releases
  resources :mixes

  # Static pages
  get 'contact' => 'contact#index'
  get 'privacy' => 'home#privacy'
  get 'legal' => 'home#legal'
  get 'about' => 'home#about'
  # You can have the root of your site routed with "root"
  root 'home#index'

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
