class GamesController < ApplicationController
  def index
  end
  def create
    game = Game.new(squares: Array.new(9))
    game.move(4, :ai)
    game.save
    redirect_to game_path(game)
  end
  def show
    @game = Game.find_by_id(params[:id])    
    @winner = GameKeeper::winner(@game)

  end
  def move
    @game = Game.find_by_id(params[:game])
    @player_square = params[:square].to_i
    @game.move(@player_square, :player)
    @ai_square = GameKeeper.ai_move(@game)
    @game.move(@ai_square, :ai) unless @game.squares.compact.count == 9
    @winner = GameKeeper.winner(@game)# need to convert nil to an empty string because javascript recognizes null, not nil
    Gon.winner = @winner

    respond_to do |format|
    # # format.html redirect_to game_path(@game)
    #  format.json { head :no_content }
      format.js {}
    end

  end
end
