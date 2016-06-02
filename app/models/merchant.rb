class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items
  has_many :customers, through: :invoices

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
    .group(:id)
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .first(quantity)
  end

  def self.ranked_by_items_sold(quantity)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: { result: 'success' })
    .group(:id)
    .order('SUM(invoice_items.quantity) DESC')
    .first(quantity)
  end

  def self.revenue_by_date(date)
    sum = Invoice
          .paid_in_full
          .where(created_at: date)
          .joins(:invoice_items)
          .sum("invoice_items.quantity * invoice_items.unit_price")
    { "total_revenue" => (sum.to_f / 100).to_s }
  end

  def total_revenue(params)
    return { "revenue" => (revenue_for(params[:date]).to_f / 100).to_s } if params[:date]
    { "revenue" => (revenue.to_f / 100).to_s }
  end

  def favorite_customer
    customers.joins(:invoices, :transactions)
      .where(transactions: { result: "success" })
      .group(:id)
      .order("count(invoices.customer_id) DESC")
      .first
  end

  def customers_with_pending_invoices
    ids = invoices.pending.pluck(:customer_id)
    Customer.find(ids)
  end

  private_class_method

  def self.string_params?(params)
    params[:name]
  end

  def revenue_for(date)
    invoices
    .paid_in_full
    .where(created_at: date)
    .joins(:invoice_items)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def revenue
    invoices
    .paid_in_full
    .joins(:invoice_items)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

end
