class Merchant < ActiveRecord::Base
  validates :name, presence: true

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
    params[:name]
  end
end
