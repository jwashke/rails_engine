class Api::V1::Merchants::RandomController < Api::ApiController
  def show
    respond_with Merchant.random
  end
end
