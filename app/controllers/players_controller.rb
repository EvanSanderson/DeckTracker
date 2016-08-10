class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
    @decks = @player.decks
    @total_wins = @player.get_wins
    @total_losses = @player.get_losses
  end

  def create
    @player = Player.create(params_player)

    if @player.save
      flash[:success] = "You succesfully created a new player!"
      redirect_to @player
    else
      render 'new'
    end
end

def edit
  @player = Player.find(params[:id])
end

def update
  @player = Player.find(params[:id])
  @player.update(params_player)

  if @player.save
    flash[:success] = "You succesfully updated a player!"
    redirect_to @player
  else
    render 'edit'
  end
end

def destroy
  @player = Player.find(params[:id])
  @player.destroy
  flash[:success] = "You succesfully deleted a player!"
  redirect_to players_path
end


  private
    def params_player
      params.require(:player).permit(:name, :wins, :losses)
    end

end
