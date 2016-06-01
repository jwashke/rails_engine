class Api::V1::Items::MostRevenuesController < Api::ApiController
  def index
    respond_with Item.ranked_by_revenue(params[:quantity])
  end
end
