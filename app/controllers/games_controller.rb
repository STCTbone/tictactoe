class GamesController < ApplicationController
  def index
  end
  def create
    game = Game.create
    redirect_to game_path(game)
  end
  def show
    @game = Game.find_by_id(params[:id])    
  end
  def move
    game = Game.find_by_id(params[:game])
    game.move(params[:square].to_i, :player)
    redirect_to game_path(game.id)
  end
end
