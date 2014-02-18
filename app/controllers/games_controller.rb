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
    gon.winner = ""

  end

  def move
    @game = Game.find_by_id(params[:game])
    @player_square, @ai_square = make_moves(@game, params[:square].to_i)
    @winner = GameKeeper.winner(@game)
    gon.winner = @winner

    respond_to :js
  end

  private

  def make_moves(game,player_square)
    game.move(player_square, :player)
    ai_square = GameKeeper.ai_move(@game)
    game.move(ai_square, :ai) unless game.squares.compact.count == 9

    return player_square, ai_square
  end


end
