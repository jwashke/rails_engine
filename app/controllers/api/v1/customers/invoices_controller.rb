class Api::V1::Customers::InvoicesController < Api::ApiController
  def index
    respond_with Customer.find(params[:id]).invoices
  end
end
