class Product < ActiveRecord::Base
  belongs_to :supplier

  def discounted?
    price.to_f < 100.0
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end
end
