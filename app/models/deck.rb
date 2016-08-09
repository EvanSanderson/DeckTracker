class Deck < ApplicationRecord
  has_many :cards, through: :meta
  has_many :cards, dependent: :destroy
  has_many :meta
  has_many :matchups, dependent: :destroy
  belongs_to :player
  validates :name, presence: true
  validates :wins, presence: true
  validates :losses, presence: true

  def get_wins
    sum = 0
    self.matchups.each do |matchup|
      sum += matchup.wins
    end
    sum
  end

  def get_losses
    sum = 0
    self.matchups.each do |matchup|
      sum += matchup.losses
    end
    sum
  end


end
