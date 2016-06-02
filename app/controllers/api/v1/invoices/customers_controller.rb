class Api::V1::Invoices::CustomersController < Api::ApiController
  def show
    respond_with Invoice.find(params[:id]).customer
  end
end
