class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :squares

  after_save :create_squares

  def create_squares
    9.times do |i|
      Square.create(game_id: self.id, position: (i + 1))
    end
  end

  def move(square, mover)
    move_square = self.squares.find_by_position(square)
    move_square.mark = "X"
    move_square.save
  end
end
