class Api::V1::Merchants::MostItemsController < Api::ApiController
  def index
    respond_with Merchant.ranked_by_items_sold(params[:quantity])
  end
end
