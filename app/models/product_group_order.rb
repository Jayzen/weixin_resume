class ProductGroupOrder < ApplicationRecord
  belongs_to :guest
  belongs_to :product_group

  has_many :product_group_order_joins, dependent: :destroy
end
