class House < ApplicationRecord
  belongs_to :user
  has_many :follows

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    TYPES = ['Villa', 'Flat', 'Maisonette', 'Chalet']
end
