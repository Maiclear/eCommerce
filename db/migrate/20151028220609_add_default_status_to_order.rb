class AddDefaultStatusToOrder < ActiveRecord::Migration
  def change
    change_column :orders, :status, :integer, default: 0, null: false
  end
end
