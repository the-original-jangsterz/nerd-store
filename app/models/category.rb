class Category < ActiveRecord::Base
  has_many :categorized_products
  has_many :products, through: :categorized_products
end
