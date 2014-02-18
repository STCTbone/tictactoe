class Game < ActiveRecord::Base
  include GameKeeper
  serialize :squares, Array
  serialize :moves, Array
  attr_accessible :squares, :moves, :player_turn

  def move(square, mover)
    if mover == :player
      self.squares[square] = 'O'
    elsif mover == :ai
      self.squares[square] = 'X'
    end
    self.save
  end

end
