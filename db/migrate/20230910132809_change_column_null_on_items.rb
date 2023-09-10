class ChangeColumnNullOnItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :name, true
    change_column_null :items, :introduction, true
   
  end
end
