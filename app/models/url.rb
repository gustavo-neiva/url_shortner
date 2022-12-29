class Url < ApplicationRecord
  has_one :page
  validates :url, presence: true

  def self.last_100
    self.last(100).as_json({
      only: [:url, :short_url, :id],
      include: [
        page: { only: [:title] }
      ]
    })
  end
end
