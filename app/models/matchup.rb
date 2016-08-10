class Matchup < ApplicationRecord
  belongs_to :deck
  validates :character_class, presence: true
  validates :play_style, presence: true
  validates :wins, presence: true
  validates :losses, presence: true
end
