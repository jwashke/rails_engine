class Api::V1::Items::MerchantsController < Api::ApiController
  def show
    respond_with Item.find(params[:id]).merchant
  end
end
