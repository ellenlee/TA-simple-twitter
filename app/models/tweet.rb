class Tweet < ApplicationRecord
  validates_length_of :description, maximum: 140

  has_many :replies, dependent: :destroy
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
end
