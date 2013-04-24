require 'spec_helper'

describe Game do
  let(:game) {Game.create(squares: Array.new(9))} 
  describe "game.new" do
    it "should create 9 Squares, one for each spot on the board" do
      game.squares.count.should == 9
    end
  end
  describe "game.move" do
    context "it's the player's move" do
      it "marks the appropriate square with an X" do
        game.move(5, :player)
        game.squares[5].should == "O"
      end
    end
    context "it is the AI's move" do
      it "marks the appropriate square with an O" do
        game.move(5, :ai)
        game.squares[5].should == "X"
      end
    end
  end
  describe "game.ai_move" do
    it "return a blocking move for the AI to make" do
      game.move(0, :player)
      game.move(1, :player)
      game.ai_move.should == 2
    end
  end
end
