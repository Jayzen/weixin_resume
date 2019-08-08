class ProductLike < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :guest
  default_scope { order(created_at: :desc) }
end
