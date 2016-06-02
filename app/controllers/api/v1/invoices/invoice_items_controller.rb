class Api::V1::Invoices::InvoiceItemsController < Api::ApiController
  def index
    respond_with Invoice.find(params[:id]).invoice_items
  end
end
