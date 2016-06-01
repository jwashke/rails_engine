class Api::V1::CustomersController < Api::ApiController
  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end
end
