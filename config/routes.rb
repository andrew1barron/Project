Rails.application.routes.draw do
  # very important page to the application
  # shows all the routes that are used in the app 
  # view routes using rake routes command in the terminal 
  # landing page is root page shown below 

  # route to posts and replies, whoch belong to posts 
  resources :posts do
    resources :replies
  end 
 
  # routes to create new user, log in and log out 
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #route to get users
  resources :users

  #route to equipment, skills, and food index page 
  get 'equipment/index'

  #route to routes index page. Links to sub pages are shown below 
  get 'routes/index'

  #not used anymore - oroginal version of posting and replies that was futher developed 
  resources :articles do
    resources :comments 
  end 

  #end is essential here - it completes the hierarchical nest

  # route to contact page index displaying dates and information 
  resources :contact
  get 'home/page'

  # route to staff page of the app 
  resources :staff_page
  get 'home/page'

  # this allows routes to provinces index be created
  # routes to individual provinces also created here 
  # solved issue with routes was solved by adding routes to specific routes here. 
  resources :routes do
    collection do
      # routes to provinces 
      get :leinster
      get :munster
      get :connacht
      get :ulster
      # routes to individual hillwalking routes 
      get 'Leinster2010', to: 'routes#Leinster2010', as: 'L2010'
      get 'Munster2015', to: 'routes#Munster2015', as: 'M2015'
      get 'Connacht2014', to: 'routes#Connacht2014', as: 'C2014'
      get 'Ulster2014', to: 'routes#Ulster2014', as: 'U2014'
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # this is the route to the home page of the app 
  root 'home#page'



  # ALL EXAMPLES BELOW HERE 
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
