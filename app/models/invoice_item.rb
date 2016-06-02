class InvoiceItem < ActiveRecord::Base
  validates :item_id,    presence: true
  validates :invoice_id, presence: true
  validates :quantity,   presence: true
  validates :unit_price, presence: true

  belongs_to :item
  belongs_to :invoice

  def self.find_one_by(params)
    params[:unit_price] = sanitize_unit_price(params) if params[:unit_price]
    where(params).limit(1).first
  end

  def self.find_all_by(params)
    params[:unit_price] = sanitize_unit_price(params) if params[:unit_price]
    where(params)
  end

  def self.random
    limit(1).order("RANDOM()")
  end

  def self.sanitize_unit_price(params)
    (params[:unit_price].to_f * 100).round
  end
end
