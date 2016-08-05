class CardsController < ApplicationController

  def new
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.build
  end

def show
  @player = Player.find(params[:player_id])
  @deck = Deck.find(params[:deck_id])

  @card = Card.find(params[:id])
end


def create
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.create(params_card)

  if @card.save
    redirect_to player_deck_path(@deck.player, @deck), notice: "You succesfully added a card!"
  else
    render 'new'
  end
end

def edit
  @player = Player.find(params[:player_id])
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:id])
end

def update
  @player = Player.find(params[:player_id])
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
    @card.update(params_card)

  if @card.save
    redirect_to player_deck_path(@deck.player, @deck), notice: "You succesfully updated the card!"
  else
    render 'edit'
  end

end

def destroy
  @player = Player.find(params[:player_id])
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
  @card.destroy

  redirect_to player_deck_path(@deck.player, @deck), notice: "You succesfully updated the card!"
end

  private
    def params_card
      params.require(:card).permit(:name, :effect, :img_url, :attack, :defense, :description, :mana, :rarity)
    end
end
