class Api::V1::Items::RandomController < Api::ApiController
  def show
    respond_with Item.random
  end
end
