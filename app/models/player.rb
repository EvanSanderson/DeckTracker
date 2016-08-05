class Player < ApplicationRecord
  has_many :decks, dependent: :destroy
  validates :name, presence: :true
end
