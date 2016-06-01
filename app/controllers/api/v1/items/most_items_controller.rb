class Api::V1::Items::MostItemsController < Api::ApiController
  def index
    respond_with Item.ranked_by_items_sold(params[:quantity])
  end
end
