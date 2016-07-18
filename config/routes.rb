Rails.application.routes.draw do
  resources :shmnotifications
  resources :shmmenuitem_photos
  resources :shmorders
  resources :shmconversations
  resources :shmeals
  resources :menu_items
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
