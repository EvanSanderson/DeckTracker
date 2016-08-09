class Player < ApplicationRecord
  has_many :decks, dependent: :destroy
  validates :name, presence: :true
  def get_wins
    sum = 0
    self.decks.each do |deck|
      sum += deck.get_wins
    end
    sum
  end

  def get_losses
    sum = 0
    self.decks.each do |deck|
      sum += deck.get_losses
    end
    sum
  end
end
