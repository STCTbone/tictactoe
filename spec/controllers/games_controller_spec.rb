require 'spec_helper'

describe GamesController do
  let(:game) {mock_model(Game).as_null_object}
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
    response.should redirect_to(game_path(1))
  end

end
