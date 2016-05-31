Rails.application.routes.draw do
  # GET /api/v1/merchants.json

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :customers, only: [:index, :show]
    end
  end
end
