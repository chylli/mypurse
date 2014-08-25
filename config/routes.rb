Rails.application.routes.draw do

  get 'reports/property'

  get 'reports/earning'

  get 'reports/expense'

  #get 'accounting/index'
  #get 'accounting/accounts'
  #get 'accounting/transactions'

  #get 'booking/index'

  get 'configure/language'
  patch 'configure/update_language'

  #TODO delete this route
  get 'configure', to: 'configure#index'
  get 'configure/property_categories', to: 'configure#categories', category_type: 'PropertyCategory'
  get 'configure/liability_categories', to: 'configure#categories', category_type: 'LiabilityCategory'
  get 'configure/earning_categories', to: 'configure#categories', category_type: 'EarningCategory'
  get 'configure/expense_categories', to: 'configure#categories', category_type: 'ExpenseCategory'

  get 'configure/accounts'

  resources :transactions do
    collection do
      get 'accounts'
    end
  end

  resources :accounts

  # for account STI
  resources :earning_accounts, controller: 'accounts', type: 'EarningAccount'
  resources :expense_accounts, controller: 'accounts', type: 'ExpenseAccount'
  resources :cash_accounts, controller: 'accounts', type: 'CashAccount'
  resources :demand_accounts, controller: 'accounts', type: 'DemandAccount'

  resources :categories

  # for Category STI
  resources :property_categories, controller: 'categories', type: 'PropertyCategory'
  resources :liability_categories, controller: 'categories', type: 'LiabilityCategory'
  resources :earning_categories, controller: 'categories', type: 'EarningCategory'
  resources :expense_categories, controller: 'categories', type: 'ExpenseCategory'


  controller :sessions do
    get 'signin' => :new
    post 'signin' => :create
    delete 'signout' => :destroy
  end

  resource :user

  get 'signup' => 'users#new'

  root 'reports#property'
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
