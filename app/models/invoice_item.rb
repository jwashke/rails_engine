class InvoiceItem < ActiveRecord::Base
  validates :item_id,    presence: true
  validates :invoice_id, presence: true
  validates :quantity,   presence: true
  validates :unit_price, presence: true

  belongs_to :item
  belongs_to :invoice

  def self.find_one_by(params)
    where(params).limit(1)
  end

  def self.find_all_by(params)
    where(params)
  end

  def self.random
    limit(1).order("RANDOM()")
  end
end
