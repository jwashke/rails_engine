class Transaction < ActiveRecord::Base
  validates :invoice_id,         presence: true
  validates :credit_card_number, presence: true
  validates :result,             presence: true

  belongs_to :invoice

  def self.find_one_by(params)
    if string_params?(params)
      key = params.keys.first
      where("lower(#{key}) = lower(?)", params[key]).limit(1)
    else
      where(params).limit(1)
    end
  end

  def self.find_all_by(params)
    if string_params?(params)
      key = params.keys.first
      where("lower(#{key}) = lower(?)", params[key])
    else
      where(params)
    end
  end

  def self.random
    limit(1).order("RANDOM()")
  end

  private_class_method

  def self.string_params?(params)
    params[:credit_card_number] || params[:result]
  end
end
