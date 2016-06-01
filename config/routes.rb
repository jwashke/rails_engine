Rails.application.routes.draw do
  # GET /api/v1/merchants.json

  namespace :api, default: { format: :json } do
    namespace :v1 do
      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :customers, only: [:index, :show]
    end
  end
end
