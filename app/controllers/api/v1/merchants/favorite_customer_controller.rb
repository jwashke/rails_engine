class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController
  def show
    respond_with Merchant.find(params[:id]).favorite_customer
  end
end
