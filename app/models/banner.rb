class Banner < ApplicationRecord
  belongs_to :user
  has_many :banner_items, dependent: :destroy

  validates :name, presence: { message: "名称不能为空" }
end
