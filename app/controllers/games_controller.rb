class GamesController < ApplicationController
  def index
  end
  def create
    game = Game.create
    redirect_to game_path(1)
  end
  def show
    
  end
end
