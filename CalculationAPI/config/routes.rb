Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    #Deck
      get 'deck_cards/top' => 'deck_cards#top'
      delete 'deck_cards/:card_id' => 'deck_cards#destroy'
      delete 'deck_cards' => 'deck_cards#destroy'
    
    #Points Piles
      get 'point1_cards/top' => 'point1_cards#top'
      delete 'point1_cards/:card_id' => 'point1_cards#destroy'
      delete 'point1_cards' => 'point1_cards#destroy'
    
      get 'point2_cards/top' => 'point2_cards#top'
      delete 'deck_cards/:card_id' => 'point2_cards#destroy'
      delete 'point2_cards' => 'point2_cards#destroy'
    
      get 'point3_cards/top' => 'point3_cards#top'
      delete 'deck_cards/:card_id' => 'point3_cards#destroy'
      delete 'point3_cards' => 'point3_cards#destroy'
    
      get 'point4_cards/top' => 'point4_cards#top'
      delete 'deck_cards/:card_id' => 'point4_cards#destroy'
      delete 'point4_cards' => 'point4_cards#destroy'
    
    #Waste Piles
      get 'waste1_cards/top' => 'waste1_cards#top'
      delete 'waste1_cards/:card_id' => 'waste1_cards#destroy'
      delete 'waste1_cards' => 'waste1_cards#destroy'
      
      get 'waste2_cards/top' => 'waste2_cards#top'
      delete 'waste2_cards/:card_id' => 'waste2_cards#destroy'
      delete 'waste2_cards' => 'waste2_cards#destroy'
      
      get 'waste3_cards/top' => 'waste3_cards#top'
      delete 'waste3_cards/:card_id' => 'waste3_cards#destroy'
      delete 'waste3_cards' => 'waste3_cards#destroy'
      
      get 'waste4_cards/top' => 'waste4_cards#top'
      delete 'waste4_cards/:card_id' => 'waste4_cards#destroy'
      delete 'waste4_cards' => 'waste4_cards#destroy'
      
    resources :deck_cards, :point1_cards, :point2_cards, :point3_cards, :point4_cards, :waste1_cards, :waste2_cards, :waste3_cards, :waste4_cards

  end
  
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
