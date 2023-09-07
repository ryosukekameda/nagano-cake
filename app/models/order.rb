class Order < ApplicationRecord
  enum payment_method: { credit: 0, transfer: 1 }
end
