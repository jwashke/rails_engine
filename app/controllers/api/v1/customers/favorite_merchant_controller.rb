class Api::V1::Customers::FavoriteMerchantController < Api::ApiController

  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end
