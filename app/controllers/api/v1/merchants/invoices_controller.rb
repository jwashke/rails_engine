class Api::V1::Merchants::InvoicesController < Api::ApiController
  def index
    respond_with Merchant.find(params[:id]).invoices
  end
end
