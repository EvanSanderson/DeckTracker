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

  def increment_wins
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @matchup = Matchup.find(params[:id])
    @matchup.wins += 1
    @matchup.save

    redirect_to player_deck_matchup_path(@player, @deck, @matchup), notice: "Added a win!"
  end

def increment_losses
  @player = Player.find(params[:player_id])
  @deck = Deck.find(params[:deck_id])
  @matchup = Matchup.find(params[:id])
  @matchup.losses += 1
  @matchup.save

  redirect_to player_deck_matchup_path(@player, @deck, @matchup), notice: "Added a loss!"
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

  def edit
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @matchup = Matchup.find(params[:id])
  end

  def update
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @matchup = @deck.matchups.find(params[:id])
    @matchup.update(params_matchup)

    if @matchup.save
      redirect_to player_deck_path(@deck.player, @deck), notice: "You succesfully updated the matchup!"
    else
      render 'edit'
    end

  end

  def destroy
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:deck_id])
    @matchup = @deck.matchups.find(params[:id])
    @matchup.destroy

    redirect_to player_deck_path(@deck.player, @deck), notice: "You succesfully deleted the matchup!"
  end


  private
    def params_matchup
      params.require(:matchup).permit(:character_class, :play_style, :wins, :losses, :notes)
    end

end
