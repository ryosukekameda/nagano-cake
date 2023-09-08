class AddIsSalesStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_sales_status, :boolean, default: false, null: false
  end
end
