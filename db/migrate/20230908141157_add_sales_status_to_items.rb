class AddSalesStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :sales_status, :boolean, default: false, null: false
  end
end
