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

  #implementing the minimax algorithm
  
 # def best_move
 #   return self.moves.max { |a, b| a.score <=> b.score  }
 # end

  
  def score
    if self.winner == 'X'
        return -1
    elsif self.winner == 'O'
    	return 1
    elsif self.squares.compact.count == 9 #a draw
    	return 0
    else # the game isn't over yet
    	lower_scores = self.moves.map { |move| move.score}
    	self.player == 'X' ? lower_scores.min : lower_scores.max
    end   
  end

def generate_moves
    next_player = (self.player_turn == 'X' ? 'O' : 'X')
    puts self.squares[0]
    self.squares.each_with_index do |square, position|
      puts square
      unless square
        next_squares = self.squares.dup
        next_squares[position] = self.player_turn

        next_game = Game.create(player_turn: next_player, squares: next_squares)
        self.moves << next_game
        next_game.generate_moves
        self.save
      end
    end
end

end
