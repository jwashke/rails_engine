class Api::V1::Transactions::RandomController < Api::ApiController
  def show
    respond_with Transaction.random
  end
end
