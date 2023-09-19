class RemoveAdminFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :admin, :boolern
  end
end
