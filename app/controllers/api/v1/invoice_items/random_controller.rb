class Api::V1::InvoiceItems::RandomController < Api::ApiController
  def show
    respond_with InvoiceItem.random
  end
end
