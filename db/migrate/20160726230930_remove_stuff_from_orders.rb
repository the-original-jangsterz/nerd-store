class RemoveStuffFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
