class Api::V1::Invoices::TransactionsController < Api::ApiController
  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
