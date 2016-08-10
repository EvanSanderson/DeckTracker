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
      if matchup.wins == nil
        matchup.wins = 0
      end
      sum += matchup.wins
    end
    sum
  end

  def get_losses
    sum = 0

    self.matchups.each do |matchup|
      if matchup.losses == nil
        matchup.losses = 0
      end
      sum += matchup.losses
    end
    sum
  end


end
