Rails.application.routes.draw do
  resources :shmcookstatuses
  resources :shmfundings
  resources :merchantwebhooks
  resources :shmshmealattributes
  resources :shmorderfeedbacks
  resources :shmuserattributes
  resources :shmrequestattributes
  resources :shmpaymentmethodstatuses
  resources :shmmenuitemstatuses
  resources :shmrequeststatuses
  resources :shmuserstatuses
  resources :shmpaymentnonces
  resources :shmcustomerpmtmethods
  resources :shmcooks
  resources :shmaddresses
  resources :shmcheckouts
  resources :shmtransactions
  get 'transactions/new'
  resources :menuitems
  resources :shmorders
  resources :shmconversations
  resources :shmeals do
    resources :shmshmealstatuses, except: [:index]
    #resources :shmshmealstatuses, only: [:show, :new, :create]
    #resources :shmshmealstatuses, except: [:index], controller: 'shmeals/shmshmealstatuses'
  end
  resources :shmshmealstatuses, only: [:index]
  resources :users
  resources :transactions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
