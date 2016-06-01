class Invoice < ActiveRecord::Base
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.find_one_by(params)
    where(params).limit(1).first
  end

  def self.find_all_by(params)
    where(params)
  end

  def self.random
    limit(1).order("RANDOM()")
  end

  def self.paid_in_full
    joins(:transactions).where(transactions: { result: "success" })
  end

  private_class_method

  def self.string_params?(params)
    params[:status]
  end
end
