class Api::V1::Merchants::MostRevenuesController < Api::ApiController
  def index
    respond_with Merchant.ranked_by_revenue(params[:quantity])
  end
end
