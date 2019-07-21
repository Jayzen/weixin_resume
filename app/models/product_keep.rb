class ProductKeep < ApplicationRecord
  belongs_to :product
  belongs_to :guest 
end
