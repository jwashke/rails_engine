class Api::V1::Merchants::TransactionRevenueController < Api::ApiController
  def show
    respond_with Merchant.find(params[:id]).total_revenue(params)
  end
end
