class Api::V1::Customers::Controller < Api::ApiController
  def show
    respond_with Customer.random
  end
end
