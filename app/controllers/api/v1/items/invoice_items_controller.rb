class Api::V1::Items::InvoiceItemsController < Api::ApiController
  def index
    respond_with Item.find(params[:id]).invoice_items
  end
end
