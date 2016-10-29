Rails.application.routes.draw do
  resources :shmtransactions
  get 'transactions/new'

  resources :devices
  resources :shmchatchannels
  resources :menuitems
  resources :shmnotifications
  resources :shmmenuitem_photos
  resources :shmorders
  resources :shmconversations
  resources :shmeals
  resources :menu_items
  resources :users
  resources :transactions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
