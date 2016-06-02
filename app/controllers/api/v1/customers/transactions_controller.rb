class Api::V1::Customers::TransactionsController < Api::ApiController
  def index
    respond_with Customer.find(params[:id]).transactions
  end
end
