Rails.application.routes.draw do

  get 'accounting/index'
  get 'accounting/accounts'

  get 'booking/index'

  get 'configure/language'
  patch 'configure/update_language'

  get 'configure/categories'
  get 'configure/accounts'
  resources :transactions

  resources :accounts

  # for account STI
  resources :earning_accounts, controller: 'accounts', type: 'EarningAccount'
  resources :expense_accounts, controller: 'accounts', type: 'ExpenseAccount'
  resources :cash_accounts, controller: 'accounts', type: 'CashAccount'

  resources :categories

  # for Category STI
  resources :account_categories, controller: 'categories', type: 'AccountCategory'
  resources :earning_categories, controller: 'categories', type: 'EarningCategory'
  resources :expense_categories, controller: 'categories', type: 'ExpenseCategory'


  controller :sessions do
    get 'signin' => :new
    post 'signin' => :create
    delete 'signout' => :destroy
  end

  resource :user

  get 'signup' => 'users#new'

  root 'users#new'
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
