class Card < ApplicationRecord
  has_many :decks, through: :meta
  belongs_to :deck
  has_many :meta
end
