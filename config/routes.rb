Rails.application.routes.draw do
  resources :card_costs, only: [:index, :create] do
    collection do
      post :binlist_cost
    end
  end

  root "hello#index"
end
