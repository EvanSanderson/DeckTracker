class Deck < ApplicationRecord
  has_many :cards, through: :meta
  has_many :cards, dependent: :destroy
  has_many :meta
  has_many :matchups, dependent: :destroy
  belongs_to :player
  validates :name, presence: true
  validates :wins, presence: true
  validates :losses, presence: true


end
