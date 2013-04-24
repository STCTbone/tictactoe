require 'spec_helper'
describe GamesController do
  let(:game) {mock_model(Game).as_null_object}
   describe "games#create" do


    before(:each) do
      Game.stub(:new).and_return(game)
    end

    it "creates a new game" do  
      Game.should_receive(:new).and_return(game)
      post :create
    end

    it "saves the new game" do
      game.should_receive(:save)
      post :create
    end

    it "redirects to games#show for the new game" do
      post :create
      response.should redirect_to(game_path(game))
    end

  end
  describe "games#move" do
    before(:each) do
      game.stub(:id).and_return(1)
      Game.stub(:find_by_id).and_return(game)
    end
    it "should send a message to the game specifying the move" do
      game.should_receive(:move).with(5, :player)
      put :move, square: 5, mover: :player 
    end
    it "should redirect to the game being played" do
      put :move, square: 5, mover: :player
      response.should redirect_to game_path(game)
    end
  end

end
