class AddQuantityToProductOrder < ActiveRecord::Migration
  def change
    add_column :product_orders, :quantity, :integer
  end
end
