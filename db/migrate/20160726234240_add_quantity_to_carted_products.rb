class AddQuantityToCartedProducts < ActiveRecord::Migration
  def change
    add_column :carted_products, :quantity, :integer
  end
end
