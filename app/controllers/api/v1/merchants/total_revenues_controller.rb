class Api::V1::Merchants::TotalRevenuesController < Api::ApiController
  def show
    respond_with Merchant.revenue_by_date(params[:date])
  end
end
