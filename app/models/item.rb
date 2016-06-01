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
    .group('items.id')
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .limit(quantity)
  end

  def self.ranked_by_items_sold(quantity)
    select("items.*, sum(quantity) as number_sold")
        .joins(invoices: :transactions)
        .where(transactions: {result: "success"})
        .group("items.id")
        .order("number_sold DESC")
        .limit(quantity)
  end

  def best_day
    invoices.paid_in_full.select("invoices.created_at, sum(invoice_items.quantity) as items_sold").group("invoices.created_at").order("items_sold DESC").first
  end

  private_class_method

  def self.string_params?(params)
    params[:name] || params[:description]
  end


  def self.sanitize_unit_price(params)
    (params[:unit_price].to_f * 100).round
  end
end
