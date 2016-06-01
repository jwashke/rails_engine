class Transaction < ActiveRecord::Base
  validates :invoice_id,         presence: true
  validates :credit_card_number, presence: true
  validates :result,             presence: true

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

  private_class_method

  def self.string_params?(params)
    params[:credit_card_number] || params[:result]
  end
end
