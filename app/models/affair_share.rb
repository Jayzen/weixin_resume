class AffairShare < ApplicationRecord
  belongs_to :guest
  belongs_to :affair, counter_cache: true
end
