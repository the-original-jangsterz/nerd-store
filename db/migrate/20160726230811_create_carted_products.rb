class CreateCartedProducts < ActiveRecord::Migration
  def change
    create_table :carted_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :status
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
