class Invoice < ActiveRecord::Base
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true

  belongs_to :customer
  belongs_to :merchant

  def self.find_one_by(params)
    key = params.keys.first
    value = params.values.first
    if key.downcase == "status"
      where("lower(#{key}) = lower(?)", value).limit(1)
    else
      where(params)
    end
  end

  def self.find_all_by(params)
    key = params.keys.first
    value = params.values.first
    if key.downcase == "status"
      where("lower(#{key}) = lower(?)", value)
    else
      where(params)
    end
  end

  def self.random
    limit(1).order("RANDOM()")
  end
end
