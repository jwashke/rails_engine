class Api::V1::Invoices::MerchantsController < Api::ApiController
  def show
    respond_with Invoice.find(params[:id]).merchant
  end
end
