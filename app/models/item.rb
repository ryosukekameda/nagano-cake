class Item < ApplicationRecord
  has_one_attached :image
  
  def add_tax_sales_price
    (self.sales_price * 1.10).round
  end
end
