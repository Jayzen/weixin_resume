class AffairComment < ApplicationRecord
  belongs_to :guest
  belongs_to :affair, counter_cache: true

  module Status
    On = true
    Off = false
  end

  validates :content, presence: { message: "内容不能为空" }
end
