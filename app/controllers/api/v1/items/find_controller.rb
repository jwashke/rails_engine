class Api::V1::Items::FindController < Api::ApiController
  def show
    respond_with Item.find_one_by(item_params)
  end

  def index
    respond_with Item.find_all_by(item_params)
  end

  private

  def item_params
    params.permit(
      :name,
      :description,
      :unit_price,
      :merchant_id,
      :created_at,
      :updated_at
    )
  end
end
