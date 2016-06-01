class Api::V1::CustomersController < Api::ApiController
  def index
    respond_with Customer.all
  end
end
