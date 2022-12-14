class Product < ApplicationRecord
  belongs_to :business
  has_many :product_itineraries
  has_many_attached :photos
  has_many :itineraries, through: :product_itineraries

  include PgSearch::Model
  pg_search_scope :search_by_product,
                  against: [:name, :category, :brand],
                  using: {
                    trigram: {
                      word_similarity: true
                    }
                  }
end
