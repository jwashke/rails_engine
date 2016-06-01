class Api::V1::Merchants::ItemsController < Api::ApiController
  def index
    respond_with Merchant.find(params[:id]).items
  end
end
