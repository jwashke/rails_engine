class Api::V1::Customers::FindController < Api::ApiController
  # def show
  #   respond_with Customer.find_one_by(customer_params)
  # end
  #
  # def index
  #   respond_with Customer.find_all_by(customer_params)
  # end

  private

  def model
    Customer
  end

  def customer_params
    params.permit(:first_name, :last_name, :created_at, :updated_at)
  end
end