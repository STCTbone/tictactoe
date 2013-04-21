class AddPositionToSquares < ActiveRecord::Migration
  def change
    add_column :squares, :position, :integer
  end
end
