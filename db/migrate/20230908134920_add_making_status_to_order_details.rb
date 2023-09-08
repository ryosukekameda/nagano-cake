class AddMakingStatusToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :making_status, :integer, default: false, null: false
  end
end
