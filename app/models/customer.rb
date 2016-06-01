class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.find_one_by(params)
    key = params.keys.first
    value = params.values.first
    where("lower(#{key}) = lower(?)", value).limit(1)
  end

  def self.find_all_by(params)
    key = params.keys.first
    value = params.values.first
    where("lower(#{key}) = lower(?)", value)
  end

  def self.random
    limit(1).order("RANDOM()")
  end
end
