class Api::V1::Invoices::ItemsController < Api::ApiController
  def index
    respond_with Invoice.find(params[:id]).items
  end
end
