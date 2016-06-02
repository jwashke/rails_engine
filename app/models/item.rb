class Item < ActiveRecord::Base
  validates :name,        presence: true
  validates :description, presence: true
  validates :unit_price,  presence: true
  validates :merchant_id, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

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

  def self.ranked_by_revenue(quantity)
    joins(:invoice_items)
    .group(:id)
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .first(quantity)
  end

  def self.ranked_by_items_sold(quantity)
    joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order("sum(quantity) DESC")
    .first(quantity)
  end

  def best_day
    invoices
    .paid_in_full
    .select("invoices.created_at")
    .group("invoices.created_at")
    .order("sum(invoice_items.quantity) DESC").first
  end

  private_class_method

  def self.string_params?(params)
    params[:name] || params[:description]
  end


  def self.sanitize_unit_price(params)
    (params[:unit_price].to_f * 100).round
  end
end
