class ProductComment < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :guest

  validates :content, presence: { message: "内容不能为空" }  
  default_scope { order(created_at: :desc) }
end
