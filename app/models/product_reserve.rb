class ProductReserve < ApplicationRecord
  belongs_to :product
  belongs_to :guest 
end
