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
  end

  def create
    @player = Player.create(params_player)

    if @player.save
      redirect_to @player, notice: "You succesfully created a new player!"
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
    redirect_to @player, notice: "You've succesfully updated this player!"
  else
    render 'edit'
  end
end

def destroy
  @player = Player.find(params[:id])
  @player.destroy
  redirect_to players_path, notice: "The player has been succesfully deleted!"
end


  private
    def params_player
      params.require(:player).permit(:name, :wins, :losses)
    end

end
