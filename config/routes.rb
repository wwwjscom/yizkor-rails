ActionController::Routing::Routes.draw do |map|
  map.resources :languages



  map.resources :books, :member => { :reject => :delete, :approve => :put } do |b|
    b.resources :uploads
    b.resources :digitized_links
    b.resources :alternate_titles
    b.resources :call_nums
    b.resources :contributors 
    b.resources :council_members
    b.resources :keywords
  end
  map.resources :admins, :collection => { :keywords => :any, :logout => :get, :status => :get, :locations => :any }
  #map.resources :searches
  map.resources :keyword_types

  map.keywords 'books/:id/add_keywords', :controller => 'books', :action => 'add_keyword'
  map.keyword_types 'admins/keywords', :controller => 'admins', :action => 'keywords'
  map.location_types 'admins/locations', :controller => 'admins', :action => 'locations'
  map.suggestions 'search/suggestions', :controller => 'searches', :action => 'suggestions'
  map.search 'search', :controller => 'searches', :action => 'index'
  map.add_details 'books/:book_id/add_details', :controller => 'books', :action => 'add_details'
  map.create_details 'books/:id/create_details/:field', :controller => 'books', :action => 'create_details'
  map.pages 'books/:id/add_page', :controller => 'books', :action => 'add_page'
  map.contributors 'books/:id/add_contributor', :controller => 'books', :action => 'add_contributor'
  map.subjects 'books/:id/add_subjects', :controller => 'books', :action => 'add_subject'
  map.languages 'books/:id/add_languages', :controller => 'books', :action => 'add_language'
  map.locations 'books/:id/add_locations', :controller => 'books', :action => 'add_location'
  map.location_variations 'books/:id/add_location_variations', :controller => 'books', :action => 'add_location_variation'

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
  map.root :controller => "searches"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
