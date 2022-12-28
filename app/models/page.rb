class Page < ApplicationRecord
  belongs_to :url
  validates :title, presence: true
end
