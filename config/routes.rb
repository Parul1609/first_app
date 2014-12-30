Rails.application.routes.draw do
  devise_for :users
  get 'users/new'
  get 'users/index'
  get 'pages/info'
  get 'users/show'
  get 'ideas/post'
  get 'ideas/edit'
  get 'notification/stats'
  #get 'users/home'
  resources :ideas do
    member do
      get :like
    end
  end
  resources :users do
    member do
      get :friend
    end
  end
  resources :notification do
    collection do 
      get :friend_request_accept
      get :friend_request_reject
    end
  end
  resources :comments
  # resources :friends_users, only: [:create, :destroy]
 # resources :likes
 
  root :to => redirect('/ideas')
  #root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'home'    => 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'users' => 'users_path#users '
  get 'ideas' =>  'ideas#index'
  get 'ideas' => 'ideas#show'
  

  #get 'ideas' =>  'ideas#post'
  
  #resources :microposts,          only: [:create, :destroy]
  # get new_user_session => 'sessions#new'
  # get user_session => 'sessions#create'
  # get destroy_user_session => 'sessions#destroy' 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'home#index'

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
