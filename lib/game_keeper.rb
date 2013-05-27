module GameKeeper
 def self.ai_move(game)
    test_game = Game.new
    game.squares.each do |square| # need a deep copy as we'll be playing with poential movies
      test_game.squares << square
    end
    test_game.squares.each_with_index do | square, index | # The AI looks for winning moves
      if square == nil
        test_game.squares[index] = "X" # If marking that spot would make the AI win, the AI moves there.
        if GameKeeper.winner(test_game) == "You Lost!"
          return index
        else
          test_game.squares[index] = nil
        end
      end
    end
    test_game.squares.each_with_index do | square, index | # if there's no winning move for the AI, the AI looks for blocking moves instead.
      if square == nil
        test_game.squares[index] = "O" # If marking that spot would make the human win, the AI moves there instead.
        if GameKeeper.winner(test_game) == "You won!"
          return index
        else
          test_game.squares[index] = nil
        end
      end
    end
    
    begin
      rand_move = rand(0..8) #keep generating random positions until we find an empty one for a random move
    end while !game.squares[rand_move].nil?
    return rand_move
end

  def self.winner(game)
    current_state_x = Array.new
    current_state_o = Array.new
    game.squares.each_with_index do |square, index|
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
    ]

    winners.each do |winner|
      if winner & current_state_x == winner
        return "You Lost!"
      elsif winner & current_state_o == winner
        return "You won!"
      end
    end

    return nil
  end  
end

