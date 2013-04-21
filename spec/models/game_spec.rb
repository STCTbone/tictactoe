require 'spec_helper'

describe Game do
  describe "game.new" do
    it "should create 9 Squares, one for each spot on the board" do
      game = Game.create
      game.squares.count.should == 9
    end
  end
  describe "game.move" do
    context "it's the player's move" do
      it "marks the appropriate square with an X" do
        game = Game.create!
        game.move(5, :player)
        game.squares.find_by_id(5).mark.should == "X"
      end
    end
  end
end
