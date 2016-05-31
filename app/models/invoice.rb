class Invoice < ActiveRecord::Base
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true

  belongs_to :customer
  belongs_to :merchant
end
