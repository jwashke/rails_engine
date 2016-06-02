Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
        get "/:id/favorite_merchant", to: "favorite_merchant#show"
      end
      resources :customers, only: [:index, :show]
      #collection do
      # member do

      namespace :merchants do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/items", to: "items#index"
        get "/most_revenue", to: "most_revenues#index"
        get "/most_items", to: "most_items#index"
        get "/revenue", to: "total_revenues#show"
        get "/:id/revenue", to: "transaction_revenue#show"
        get "/:id/favorite_customer", to: "favorite_customer#show"
        get "/:id/customers_with_pending_invoices", to: "customers_with_pending_invoices#index"
      end
      resources :merchants, only: [:index, :show]

      namespace :invoices do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/transactions", to: "transactions#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/items", to: "items#index"
        get "/:id/customer", to: "customers#show"
        get "/:id/merchant", to: "merchants#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/invoice", to: "invoices#show"
        get "/:id/item", to: "items#show"
      end
      resources :invoice_items, only: [:index, :show]

      namespace :items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/merchant", to: "merchants#show"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/most_revenue", to: "most_revenues#index"
        get "/most_items", to: "most_items#index"
        get "/:id/best_day", to: "dates#show"
      end
      resources :items, only: [:index, :show]

      namespace :transactions do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/invoice", to: "invoices#show"
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
