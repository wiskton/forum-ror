Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#home'

  # facebook
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match '/signin' => 'sessions#new', :as => :signin, via: [:get, :post]

  delete 'users/destroy/' => 'users#destroy', as: 'destroy_admin_user_session'

  get 'category/:id/' => 'categories#show', as: 'category'
  get 'topic/:id/' => 'topics#show', as: 'topic'
  get 'users/ban/:id/' => 'users#ban', as: 'ban_user'
  # get 'user/:id/' => 'users#show', as: 'user'
  resources :posts
  resources :users

  get 'posts/:post_id/comments' => 'comments#index', as: 'post_comments'
  post 'posts/:post_id/comments' => 'comments#create'
  get 'posts/:post_id/comments/new' => 'comments#new', as: 'new_post_comment'
  get 'posts/:post_id/comments/:id/edit' => 'comments#edit', as: 'edit_post_comment'
  get 'posts/:post_id/comments/:id' => 'comments#show', as: 'post_comment'
  patch 'posts/:post_id/comments/:id' => 'comments#update'
  put 'posts/:post_id/comments/:id' => 'comments#update'
  delete 'posts/:post_id/comments/:id' => 'comments#destroy'

  get 'topic/:topic_id/posts' => 'posts#index', as: 'topic_posts'
  post 'topic/:topic_id/posts' => 'posts#create'
  get 'topic/:topic_id/posts/new' => 'posts#new', as: 'new_topic_post'
  get 'topic/:topic_id/posts/:id/edit' => 'posts#edit', as: 'edit_topic_post'
  get 'topic/:topic_id/posts/:id' => 'posts#show', as: 'topic_post'
  patch 'topic/:topic_id/posts/:id' => 'posts#update'
  put 'topic/:topic_id/posts/:id' => 'posts#update'
  delete 'topic/:topic_id/posts/:id' => 'posts#destroy'


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
