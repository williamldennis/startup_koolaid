Spinlister::Application.routes.draw do
  
  resources :line_items

  resources :carts

  resources :orders

  resources :users
  resources :bikes
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "pages#home"
  
  match '/contact',       :to =>'pages#contact'
  match '/about',         :to =>'pages#about'
  match '/faq',           :to =>'pages#faq'
  match '/howitworks',    :to =>'pages#howitworks'
  
  match '/uschome',       :to =>'pages#uschome'
  match '/uscwater',      :to =>'pages#uscwater'
  match '/uscsoda',       :to =>'pages#uscsoda'
  match '/usccoffee',     :to =>'pages#usccoffee'
  match '/uscenergy',     :to =>'pages#uscenergy'
  match '/uscjuice',      :to =>'pages#uscjuice'
  match '/uscsports',     :to =>'pages#uscsports'
  match '/uscflowers',    :to =>'pages#uscflowers'
  
  match '/uahome',       :to =>'pages#uahome'
  match '/uawater',      :to =>'pages#uawater'
  match '/uasoda',       :to =>'pages#uasoda'
  match '/uacoffee',     :to =>'pages#uacoffee'
  match '/uaenergy',     :to =>'pages#uaenergy'
  match '/uajuice',      :to =>'pages#uajuice'
  match '/uasports',     :to =>'pages#uasports'
  
  match '/ukhome',       :to =>'pages#ukhome'
  match '/ukwater',      :to =>'pages#ukwater'
  match '/uksoda',       :to =>'pages#uksoda'
  match '/ukcoffee',     :to =>'pages#ukcoffee'
  match '/ukenergy',     :to =>'pages#ukenergy'
  match '/ukjuice',      :to =>'pages#ukjuice'
  match '/uksports',     :to =>'pages#uksports'
  
  match '/listyourbike',  :to =>'bikes#listyourbike'
  match '/mybikes',       :to =>'bikes#bikeshow'
  match'/rentit',         :to =>'bikes#checkout'

  
  match '/signup',        :to =>'users#new'
  
  match '/signin',        :to =>'sessions#new'
  match '/signout',       :to =>'sessions#destroy'
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
