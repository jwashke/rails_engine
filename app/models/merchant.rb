class Merchant < ActiveRecord::Base
  validates :name, presence: true

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
    params[:name]
  end
end
