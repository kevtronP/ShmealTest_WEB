Rails.application.routes.draw do
  resources :shmrequestattributes
  resources :shmcheckins
  resources :shmpaymentmethodstatuses
  resources :shmmenuitemstatuses
  resources :shmshmealstatuses
  resources :shmrequeststatuses
  resources :shmuserstatuses
  resources :shmpaymentnonces
  resources :shmcustomerpmtmethods
  resources :shmcooks
  resources :shmaddresses
  resources :shmcheckouts
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
