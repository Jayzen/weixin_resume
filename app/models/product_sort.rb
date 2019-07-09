class ProductSort < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :sort
end
