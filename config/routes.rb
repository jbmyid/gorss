GoRss::Application.routes.draw do

  devise_for :users, controllers: {sessions: "user/sessions", registrations: "user/registrations", :omniauth_callbacks => "user/omniauth_callbacks"} do
    match "/login"=> "user/sessions#new"
  end

  devise_for :admin, controllers: {sessions: "admin/sessions"} do
    match "/admin" => "admin/sessions#new"
  end

  resources :feeds, only: [:show]
  namespace :admin do
    resources :feed_urls do
      member do
        get :activate
        get :deactivate
        get :generate_feeds
        get :recolor
      end
    end
    resources :users, only: [:index]
  end

  namespace :user do 
    resources :dashboard, only: [:index]
    resources :feed_urls do 
      member do
        get :generate_feeds
        get :subscribe
        get :unsubscribe
        get :recolor
      end
      collection do
        get :generate_all_feeds
      end
    end
    resources :categories do
      member do
        get :recolor
      end
    end
    resources :tabs, path: "bookmarks" do
      member do
        get :set_category
      end
    end
  end

  get "home/index"

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
