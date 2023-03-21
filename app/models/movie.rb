class Movie < ApplicationRecord
  has_many :characterizations
  has_many :genres, through: :characterizations
  has_many :ratings

  has_many :reviews

  has_many :reviews, dependent: :destroy

  validates :title, :text, presence: true
  validates :text, length: { minimum: 10 }
  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

end
