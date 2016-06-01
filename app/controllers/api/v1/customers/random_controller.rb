class Api::V1::Customers::RandomController < Api::ApiController
  def show
    respond_with Customer.random
  end
end
