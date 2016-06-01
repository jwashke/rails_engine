class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :items

  def self.find_one_by(params)
    where(params).limit(1).first
  end

  def self.find_all_by(params)
    where(params)
  end

  def self.random
    limit(1).order("RANDOM()")
  end

  def self.ranked_by_revenue(quantity)
    joins(:invoice_items)
    .group('merchants.id')
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .limit(quantity)
  end

  def self.ranked_by_items_sold(quantity)
    select( "merchants.*","SUM(invoice_items.quantity) AS item_count")
      .joins(invoices: [:transactions, :invoice_items, :items])
      .where(transactions: { result: 'success' })
      .group(:id)
      .reorder('item_count DESC')
      .limit(quantity)
  end

  def self.revenue_by_date(date)
    sum = Invoice.paid_in_full
          .where(created_at: date)
          .joins(:invoice_items)
          .sum("invoice_items.quantity * invoice_items.unit_price")
    { "total_revenue" => (sum.to_f / 100).to_s }
  end

  private_class_method

  def self.string_params?(params)
    params[:name]
  end
end
