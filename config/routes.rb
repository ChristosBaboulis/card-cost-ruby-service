Rails.application.routes.draw do
  get 'hello/index'
  
  root "hello#index"

  resources :card_costs, only: [:index, :create]
end
