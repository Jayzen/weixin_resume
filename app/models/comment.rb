class Comment < ApplicationRecord
  belongs_to :guest, optional: true
  belongs_to :user, optional: true

  validates :content, presence: { message: "内容不能为空" }
end
