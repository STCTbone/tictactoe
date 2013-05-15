class AddPlayerTurnToGames < ActiveRecord::Migration
  def change
    #noinspection RubyQuotedStringsInspection
    add_column :games, :player_turn, :string, default: "X"
  end
end
