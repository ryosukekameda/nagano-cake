class AddPriceWithoutTaxToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :price_without_tax, :integer
  end
end
