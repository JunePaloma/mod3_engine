Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get "/find"     => "search#show"
        get "/find_all" => "search#index"
      end

      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index], controller: "merchants/invoices"
        resources :items, only: [:index], controller: "merchants/items"
      end 

      resources :customers, only: [:index, :show]

      resources :transactions, only: [:index, :show]

      namespace :items do
        get "/find"     => "search#show"
        get "/find_all" => "search#index"
      end

      resources :items, only: [:index, :show] do
        resources :merchant, only: [:index], controller: "items/merchant"
        resources :invoice_items, only: [:index], controller: "items/invoice_items"
      end

      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
    end
  end
end
