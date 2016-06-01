class Api::V1::InvoiceItems::ItemsController < Api::ApiController

  def show
    respond_with InvoiceItem.find(params[:id]).item
  end
end
