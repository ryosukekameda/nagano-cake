class ChangeColumnNullOnOrder < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :customer_id, true
    change_column_null :orders, :address, true
    change_column_null :orders, :postal_code, true
    change_column_null :orders, :name, true
    change_column_null :orders, :postage, true
    change_column_null :orders, :billing_amount, true
  end
end
