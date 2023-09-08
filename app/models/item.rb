class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details
  
  validates :name, {presence: true}
  validates :introduction, {presence: true}
  
  def add_tax_sales_price
    (self.sales_price * 1.10).round
  end
end
