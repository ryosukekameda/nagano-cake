class AddAdminToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :admin, :boolern, default: false
  end
end
