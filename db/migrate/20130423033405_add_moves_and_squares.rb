class AddMovesAndSquares < ActiveRecord::Migration
  def change
    add_column :games, :moves, :string
    add_column :games, :squares, :string
  end

end
