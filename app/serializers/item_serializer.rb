class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :merchant_id
  attribute :unit_price_to_decimal, key: :unit_price

  def unit_price_to_decimal
    (object.unit_price.to_f / 100).to_s
  end
end

# class ItemSerializer < ActiveModel::Serializer
#   attributes :id, :name, :description
#   attribute :uppercase_name, key: :uname
#
#   has_many :orders, serializer: ItemOrderSerializer
#
#   def uppercase_name
#     object.name.upcase
#   end
# end
