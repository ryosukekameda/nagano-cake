class ChangeColumnNullOnOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_details, :order_id, true
    change_column_null :order_details, :item_id, true
    change_column_null :order_details, :price, true
    change_column_null :order_details, :amount, true
  end
end
