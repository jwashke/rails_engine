class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity
  attribute :unit_price_to_decimal, key: :unit_price

  def unit_price_to_decimal
    (object.unit_price.to_f / 100).to_s
  end
end
