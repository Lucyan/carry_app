CarryApp::Application.routes.draw do
  root to: 'static_pages#inicio'

  match 'servicio', to: 'static_pages#servicio'

  match 'cotiza' => 'cotizar#nuevo', :as => 'cotiza', :via => :get
  match 'cotiza' => 'cotizar#guardar', :as => 'cotiza', :via => :post
  match 'cotiza/puntos/agregar', to: 'cotizar#agregar_puntos'
  match 'cotiza/puntos/entregar', to: 'cotizar#entregar_puntos'
  match 'cotiza/puntos/eliminar', to: 'cotizar#eliminar_todo'
  match 'cotiza/puntos/eliminar/:id', to: 'cotizar#eliminar_punto'
  match 'cotiza/puntos/mover/arriba/:id', to: 'cotizar#mover_arriba'
  match 'cotiza/puntos/mover/abajo/:id', to: 'cotizar#mover_abajo'

  match 'contact', to: 'static_pages#contacto'

  match 'contacto' => 'contacto#new', :as => 'contacto', :via => :get
  match 'contacto' => 'contacto#create', :as => 'contacto', :via => :post


  # Admin

  match 'admin' => 'admin#index', :as => 'admin', :via => :get
  match 'admin' => 'admin#login', :as => 'admin', :via => :post
  match 'admin/logout', to: 'admin#logout'

  match 'admin/listado', to: 'admin#listado'
  match 'admin/listado/archivados', to: 'admin#listado_archivados'
  match 'admin/listado/eliminar/:id', to: 'admin#eliminar_cotizacion'
  match 'admin/listado/archivar/:id', to: 'admin#archivar_cotizacion'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
