class Square < ActiveRecord::Base
  attr_accessible :game_id, :mark, :position

  belongs_to :game
end
