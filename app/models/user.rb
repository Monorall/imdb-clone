class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :ratings

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
            format: { with: /\S+@\S+/ },
            uniqueness: { case_sensitive: false }
end
