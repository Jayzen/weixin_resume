class ProductComment < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :guest
end
