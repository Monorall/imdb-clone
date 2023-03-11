class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, :rating, :text, presence: true
  validates :text, length: { minimum: 25 }
  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  RATINGS = %w(1 2 3 4 5 6 7 8 9 10)
  validates :rating, inclusion: { in: RATINGS }
end
