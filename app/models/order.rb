class Order < ActiveRecord::Base 
  belongs_to :product
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_totals(input_carted_products)
    subtotal = 0
    input_carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end
end
