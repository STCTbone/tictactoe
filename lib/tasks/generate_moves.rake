task generate_moves: :environment do
    game = Game.create
    next_player = (game.player_turn == 'X' ? 'O' : 'X')
    game.squares.each_with_index do |square, position|
      unless square
        next_squares = game.squares.dup
        next_squares[position] = game.player_turn

        next_game = Game.create(next_player, next_squares)
        game.moves << next_game
        generate_moves(next_game)
      end
    end
  end