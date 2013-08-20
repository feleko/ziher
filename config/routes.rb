Ziher::Application.routes.draw do

  root :to => 'journals#default', :defaults => { :journal_type_id => 1 }

  get "users/new"
  post "users" => "users#create"
  devise_for :users
  resources :users
  resources :user_group_associations
  resources :groups
  resources :entries
  resources :cash_entries

  match 'journals/default' => 'journals#default', :defaults => { :journal_type_id => 1 }
  resources :journals
  match 'journals/:id/open' => 'journals#open', :as => :open_journal
  match 'journals/:id/close' => 'journals#close', :as => :close_journal
  match 'journals/type/:journal_type_id' => 'journals#index'
  match 'ksiazka_finansowa' => 'journals#default', :defaults => { :journal_type_id => 1 }, :as => :default_finance_journal
  match 'ksiazka_bankowa' =>  'journals#default', :defaults => { :journal_type_id => 2 }, :as => :default_bank_journal
  resources :journal_types

  resources :categories
  root to: "categories#index"
  resources :categories do
    post :sort, on: :collection
  end

  resources :inventory_journals

  resources :inventory_entries

  resources :units
  resources :user_unit_associations

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
