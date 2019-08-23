class ProductBargainOrderJoin < ApplicationRecord
  belongs_to :guest
  belongs_to :product_bargain_order
end
