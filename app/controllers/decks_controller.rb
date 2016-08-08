class DecksController < ApplicationController


    def all_index
      @decks = Deck.all
    end

    def new
      @player = Player.find(params[:player_id])
      @deck = @player.decks.build
    end

    def show
      @player = Player.find(params[:player_id])
      @deck = Deck.find(params[:id])
      # @deck.matchups.each do |matchup|
      #   @deck.wins += matchup.wins
      #   @deck.losses += matchup.losses
      # end
      @total_wins = 0
      @total_losses = 0
      @player.decks.each do |deck|
         @total_wins = @total_wins + deck.wins
         @total_losses = @total_losses + deck.losses
      end
    end

    def create
      @player = Player.find(params[:player_id])
      @deck = @player.decks.create(params_deck)

      if @deck.save
        redirect_to player_deck_path(@player, @deck), notice: "You've succesfully added a new deck!"
      else
        render 'new'
      end
    end

    def edit
    @player = Player.find(params[:player_id])
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(params_deck)

    if @deck.save
      redirect_to player_deck_path(@deck.player, @deck), notice: "You've succesfully updated the deck!"
    else
      render 'edit'
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    redirect_to player_path(@deck.player), notice: "You've succesfully deleted this deck!"
  end

      private
        def params_deck
          params.require(:deck).permit(:name, :character_class, :wins, :losses, :img_url)
        end

end
