class Api::V1::Invoices::FindController < Api::ApiController
  def show
    respond_with Invoice.find_one_by(invoice_params)
  end

  def index
    respond_with Invoice.find_all_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(
      :id,
      :customer_id,
      :merchant_id,
      :status,
      :created_at,
      :updated_at)
  end
end
