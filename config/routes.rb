Rails.application.routes.draw do
  resources :shmcookstatuses
  resources :shmfundings
  resources :merchantwebhooks
  resources :shmshmealattributes
  resources :shmshmealstatuses
  resources :shmorderfeedbacks
  resources :shmuserattributes
  resources :shmrequestattributes
  resources :shmpaymentmethodstatuses
  resources :shmmenuitemstatuses
  resources :shmrequeststatuses
  resources :shmuserstatuses
  resources :shmpaymentnonces
  resources :shmaddresses
  resources :shmcheckouts
  resources :shmtransactions
  get 'upcoming', action: :future, controller: 'shmeals'
  get 'fetchimage', action: :fetchaws, controller: 'shmeals'

  get 'login/:userEmail', action: :login, controller: 'users'

  get 'validshmcooks', action: :validshmcooks, controller: 'shmcooks'
  
  # get 'locationp', action: :latlng, controller: 'shmeals'
  get 'transactions/new'
  resources :menuitems do
    resources :shmshmealattributes, only: [:index], controller: 'menuitems/shmshmealattributes'
    resources :shmmenuitemstatuses, only: [:index], controller: 'menuitems/shmmenuitemstatuses'
    resources :shmeals, only: [:index], controller: 'menuitems/shmeals'
  end
  resources :shmorders do
    resources :shmorderfeedbacks, only: [:index], controller: 'shmorders/shmorderfeedbacks'
    resources :shmrequestattributes, only: [:index], controller: 'shmorders/shmrequestattributes'
    resources :shmrequeststatuses, only: [:index], controller: 'shmorders/shmrequeststatuses'
  end
  resources :shmconversations do
    resources :shmorders, only: [:index], controller: 'shmconversations/shmorders'
  end
  resources :shmeals do
    resources :shmshmealstatuses, only: [:index], controller: 'shmeals/shmshmealstatuses'
    resources :shmshmealattributes, only: [:index], controller: 'shmeals/shmshmealattributes'
    resources :shmorders, only: [:index], controller: 'shmeals/shmorders'
    #resources :shmshmealstatuses, only: [:show, :new, :create]
    #resources :shmshmealstatuses, except: [:index], controller: 'shmeals/shmshmealstatuses'
  end
  #resources :shmshmealstatuses, only: [:index]
  resources :users do
    resources :shmuserattributes, only: [:index], controller: 'users/shmuserattributes'
    resources :shmcooks, only: [:index], controller: 'users/shmcooks'
    resources :shmorders, only: [:index], controller: 'users/shmorders'
    resources :menuitems, only: [:index], controller: 'users/menuitems'
    resources :shmconversations, only: [:index], controller: 'users/shmconversations'
    resources :shmaddresses, only: [:index], controller: 'users/shmaddresses'
    resources :shmcustomerpmtmethods, only: [:index], controller: 'users/shmcustomerpmtmethods'
    resources :shmfundings, only: [:index], controller: 'users/shmfundings'
    resources :shmuserstatuses, only: [:index], controller: 'users/shmuserstatuses'
  end
  resources :shmcustomerpmtmethods do
    resources :shmpaymentmethodstatuses, only: [:index], controller: 'shmcustomerpmtmethods/shmpaymentmethodstatuses'
  end
  resources :shmcooks do
    resources :shmcookstatuses, only: [:index], controller: 'shmcooks/shmcookstatuses'
    resources :shmorders, only: [:index], controller: 'shmcooks/shmorders'
    resources :shmconversations, only: [:index], controller: 'shmcooks/shmconversations'
    resources :shmuserstatuses, only: [:index], controller: 'shmcooks/shmuserstatuses'
  end
  resources :transactions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
