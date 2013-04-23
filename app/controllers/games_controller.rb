class GamesController < ApplicationController
  def index
  end
  def create
    game = Game.new(squares: Array.new(9))
    game.move(4, :ai)
    game.save
    #game.generate_moves
    redirect_to game_path(game)
  end
  def show
    @game = Game.find_by_id(params[:id])    
    @winner = @game.winner
  end
  def move
    game = Game.find_by_id(params[:game])
    game.move(params[:square].to_i, :player)
    game.move(game.ai_move, :ai) unless game.squares.compact.count == 9 

    redirect_to game_path(game.id)
  end
end
