class Api::V1::Invoices::RandomController < Api::ApiController
  def show
    respond_with Invoice.random
  end
end
