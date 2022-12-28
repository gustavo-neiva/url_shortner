class Url < ApplicationRecord
  has_one :page
  validates :url, presence: true
end
