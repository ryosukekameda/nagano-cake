class ChangeColumnNullOnCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :cart_items, :customer_id, true
    change_column_null :cart_items, :item_id, true
    change_column_null :cart_items, :amount, true
  end
end
