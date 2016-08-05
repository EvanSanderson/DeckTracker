class Deck < ApplicationRecord
  has_many :cards, through: :meta
  has_many :cards
  has_many :meta
  belongs_to :player
  validates :name, presence: true
end
