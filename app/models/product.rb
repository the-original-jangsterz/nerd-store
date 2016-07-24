class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products

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
