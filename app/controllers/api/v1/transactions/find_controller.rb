class Api::V1::Transactions::FindController < Api::ApiController
  def show
    respond_with Transaction.find_one_by(transaction_params)
  end

  def index
    respond_with Transaction.find_all_by(transaction_params)
  end

  private

  def transaction_params
    params.permit(
      :invoice_id,
      :credit_card_number,
      :credit_card_expiration_date,
      :result,
      :created_at,
      :updated_at
    )
  end
end
