class ProductBargainOrder < ApplicationRecord
  belongs_to :guest
  belongs_to :product_bargain
  has_many :product_bargain_order_joins, dependent: :destroy
end
