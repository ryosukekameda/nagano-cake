class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price_without_tax, presence: true
  
  enum sales_status: { on_sale: 0, sales_stop: 1 }
end
