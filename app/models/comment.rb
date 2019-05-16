class Comment < ApplicationRecord
  belongs_to :guest, optional: true
  belongs_to :user, optional: true
end
