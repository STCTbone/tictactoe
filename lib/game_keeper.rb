module GameKeeper
  def self.ai_move(game)

    test_game = self.deep_copy_board(game)

     move_index = self.search_for_winner("X",GlobalConstants::LOST,test_game) || self.search_for_winner("O",GlobalConstants::WON,test_game)

    unless move_index
      move_index = self.generate_random_move(game)
    end

    return move_index
  end

  def self.deep_copy_board(game)
    test_game = Game.new

    game.squares.each do |square|
      test_game.squares << square
    end

    test_game
  end

  def self.generate_random_move(game)
      begin
        move_index = rand(0..8)
      end while !game.squares[move_index].nil?

      move_index
  end

 def self.search_for_winner(winning_move, message, test_game)
    test_game.squares.each_with_index do | square, index | # The AI looks for winning moves
      if square == nil
        test_game.squares[index] = winning_move
        if GameKeeper.winner(test_game) == message
          return index
        else
          test_game.squares[index] = nil
        end
      end
    end

    return nil #if we couldn't find anything
 end

  def self.winner(game)
    current_state_x, current_state_o = self.board_map(game)

    self.winners.each do |winner|
      if winner & current_state_x == winner
        return GlobalConstants::LOST
      elsif winner & current_state_o == winner
        return GlobalConstants::WON
      end
    end


    return nil
  end

    def self.board_map(game)
      current_state_x = Array.new
      current_state_o = Array.new

      game.squares.each_with_index do |square, index|
        if square == "X"
          current_state_x << index
        elsif square == "O"
            current_state_o << index
        end
      end

      return current_state_x, current_state_o
    end

    def self.winners
       [
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
      ]
    end

    def self.mark_winner(current_state_x, current_state_o)
    end
end

