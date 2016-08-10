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
      @total_wins = @deck.get_wins
      @total_losses = @deck.get_losses
    end


    def create
      @player = Player.find(params[:player_id])
      @deck = @player.decks.create(params_deck)

      if @deck.save
        flash[:success] = "You've succesfully added a new deck!"
        redirect_to player_deck_path(@player, @deck)
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
      flash[:success] = "You've succesfully updated the deck!"
      redirect_to player_deck_path(@deck.player, @deck)
    else
      render 'edit'
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    flash[:success] = "You've succesfully deleted this deck!"
    redirect_to player_path(@deck.player)
  end


      private
        def params_deck
          params.require(:deck).permit(:name, :character_class, :wins, :losses, :img_url, :play_style)
        end

end
