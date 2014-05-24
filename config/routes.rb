SMDProject::Application.routes.draw do

  root "pages#index"
  
  resources :sessions, only: [:new, :create, :destroy]  

  resources :members do
    resources :messages, [:new, :create, :show, :destroy]
    member do      
      get 'change_password'
      patch 'update_password'
    end
  end

  resources :societies do
    resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :reservations, only: [:new, :create, :show, :edit, :update, :destroy]
      resources :comments, only: :new
    end
    get 'join', on: :member
    get 'autocomplete', on: :collection
  end
  
  match "/search", to: "pages#search", via: [:get, :post], as: :search  
  match "/events", to: "pages#event", via: [:get, :post], as: :eventslist
  match "/registration", to: "members#new", via: [:get, :post]
  match "/login", to: "sessions#new", via: [:get, :post]
  match "/logout", to: "sessions#destroy", via: [:get, :post]
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
