class AddPlayerTurnToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_turn, :string, default: "X"
  end
end
