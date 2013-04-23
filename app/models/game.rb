class Game < ActiveRecord::Base
  serialize :squares, Array
  serialize :moves, Array
  attr_accessible :squares, :moves, :player_turn

  def move(square, mover)
    if mover == :player
      self.squares[square] = "O"
    elsif mover == :ai
      self.squares[square] = "X"
    end
    self.save
  end

  #implementing the minimax algorithm
  
 # def best_move
 #   return self.moves.max { |a, b| a.score <=> b.score  }
 # end

  def ai_move
    test_game = Game.new
    self.squares.each do |square| # need a deep copy as we'll be playing with poential movies
      test_game.squares << square
    end
    test_game.squares.each_with_index do | square, index |
      puts index
      if square == nil
        puts "found an empty square!"
        test_game.squares[index] = "O" # If marking that spot would make the human win, the AI moves there instead.
        puts test_game.inspect
        if test_game.winner == "O"
          return index
        else
          test_game.squares[index] = nil
        end
      end
    end
    begin
      rand_move = rand(0..8) #keep generating random positions until we find an empty one for a random move
    end while !squares[rand_move].nil?
    return rand_move
  end

  def winner
    current_state_x = Array.new
    current_state_o = Array.new
    self.squares.each_with_index do |square, index|
      if square == "X"
        current_state_x << index
      elsif square == "O"
          current_state_o << index
      end
    end
    winners = [
     # horizontal wins
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],

     # vertical wins
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],

     # diagonal wins
     [0, 4, 8],
     [6, 4, 2]
    ].collect { |positions|
      ( squares[positions[0]] == squares[positions[1]] &&
        squares[positions[1]] == squares[positions[2]] &&
        squares[positions[0]] ) || nil
    }.compact.first
  end 
  def score
    if self.winner == "X"
        return -1
    elsif self.winner == "O"
    	return 1
    elsif self.squares.compact.count == 9 #a draw
    	return 0
    else # the game isn't over yet
    	lower_scores = self.moves.map { |move| move.score}
    	self.player == "X" ? lower_scores.min : lower_scores.max
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
