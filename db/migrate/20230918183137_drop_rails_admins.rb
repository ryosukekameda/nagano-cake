class DropRailsAdmins < ActiveRecord::Migration[6.1]
  def change
    drop_table :rails_admin_histries
    drop_table :admins
  end
end
