class ProductGroupOrderJoin < ApplicationRecord
  belongs_to :guest
  belongs_to :product_group_order, counter_cache: true
end
