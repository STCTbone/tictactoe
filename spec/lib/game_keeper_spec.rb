require "spec_helper"
describe GameKeeper do
let(:game) {Game.create(squares: Array.new(9))}
  describe "game.ai_move" do
      it "return a blocking move for the AI to make" do
        game.move(0, :player)
        game.move(1, :player)
        GameKeeper.ai_move(game).should == 2
      end
    end
end