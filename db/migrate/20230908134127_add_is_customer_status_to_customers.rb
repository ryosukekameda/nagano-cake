class AddIsCustomerStatusToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_customer_status, :boolean, default: false, null: false
  end
end
