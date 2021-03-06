ActionController::Routing::Routes.draw do |map|
  map.resources :secchi_data
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions
  map.resources :password_resets
  map.resources :users
  map.resources :physical_data
  map.resources :sampling_types
  map.resources :samplings
  map.resources :mydata 
  map.resources :sites
  map.resources :taxa
  map.resources :organisms
  map.resources :lakes do |lake|
    lake.resources :sites
  end 
  map.resources :sites do |site|
    site.resources :samplings
  end
  map.namespace :admin do |admin|
    admin.resources :samplings
    admin.pending 'pending', :controller => 'samplings', :action => 'pending'
    admin.resources :organisms
    admin.resources :taxa
    admin.resources :users
    admin.resources :lakes
    admin.resources :sites
    admin.resources :physical_data
    admin.resources :secchi_data
  end

  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "home"
   map.home ':page', :controller => 'home', :action => 'show', :page => /about|contact|how_to/


  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
     
  map.connect ':controller/:action'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
end
