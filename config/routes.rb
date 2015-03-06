Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    get 'deck_cards/top' => 'deck_cards#top'
    get 'point1_cards/top' => 'point1_cards#top'
    get 'point2_cards/top' => 'point2_cards#top'
    get 'point3_cards/top' => 'point3_cards#top'
    get 'point4_cards/top' => 'point4_cards#top'
    get 'points1_cards/:id' => 'point1_cards#show'
    get 'deck_cards' => 'deck_cards#index'
    resources :deck_cards, :point1_cards, :point2_cards, :point3_cards, :point4_cards

  end
  get 'game_play/index'
  get 'game_play/moveToF1'
  get 'game_play/moveToF2'
  get 'game_play/moveToF3'
  get 'game_play/moveToF4'

  root 'game_play#index'

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
