class ChangeColumnNullOnCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :last_name, true
    change_column_null :customers, :first_name, true
    change_column_null :customers, :last_name_kana, true
    change_column_null :customers, :first_name_kana, true
    change_column_null :customers, :postal_code, true
    change_column_null :customers, :address, true
  end
end
