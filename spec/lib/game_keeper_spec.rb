require "spec_helper"
describe GameKeeper do
let(:game) {Game.create(squares: Array.new(9))}
  describe "game.ai_move" do
      it "returns a blocking move for the AI to make" do
        game.move(0, :player)
        game.move(1, :player)
        GameKeeper.ai_move(game).should == 2
      end
      it "returns a winning move if the AI can win with its next move" do
        game.move(0, :ai)
        game.move(1, :ai)
        GameKeeper.ai_move(game).should == 2
      end
    end

    describe "game.winner" do
      it "returns X as a winner if the AI has marked a diagonal win" do
        game.move(0, :ai)
        game.move(4, :ai)
        game.move(8, :ai)
        GameKeeper.winner(game).should == "You Lost!"
      end
    end
end