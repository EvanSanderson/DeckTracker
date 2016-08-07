class MatchupsController < ApplicationController

  def index
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @matchups = @deck.matchups.all
  end
  
  def show
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @matchup = @deck.matchups.find(params[:id])
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @matchup = Matchup.new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @matchup = @deck.matchups.create(params_matchup)

    if @matchup.save
      redirect_to player_deck_matchup_path(@deck.player, @deck, @matchup), notice: "You've succesfully created a new matchup!"
    else
      render 'new'
    end

  end

  private
    def params_matchup
      params.require(:matchup).permit(:character_class, :play_style, :wins, :losses, :notes)
    end

end
