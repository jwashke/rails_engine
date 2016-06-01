class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices

  def self.find_one_by(params)
    where(params).limit(1).first
  end

  def self.find_all_by(params)
    where(params)
  end

  def self.random
    limit(1).order("RANDOM()")
  end

  private_class_method

  def self.string_params?(params)
    params[:first_name] || params[:last_name]
  end
end
