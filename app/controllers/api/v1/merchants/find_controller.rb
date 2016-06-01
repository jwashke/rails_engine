class Api::V1::Merchants::FindController < Api::ApiController
  def show
    respond_with Merchant.find_one_by(merchant_params)
  end

  def index
    respond_with Merchant.find_all_by(merchant_params)
  end

  private

  def merchant_params
    params.permit(:name, :created_at, :updated_at, :id)
  end
end
