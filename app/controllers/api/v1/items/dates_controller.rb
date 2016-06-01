class Api::V1::Items::DatesController < Api::ApiController
  def show
    respond_with Item.find(params[:id]).best_day, serializer: BestDaySerializer
  end
end
