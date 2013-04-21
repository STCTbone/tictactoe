class CreateSquares < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.integer :game_id
      t.string :mark

      t.timestamps
    end
  end
end
