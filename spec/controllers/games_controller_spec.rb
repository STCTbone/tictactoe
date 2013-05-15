require 'spec_helper'
describe GamesController do
   describe 'games#create' do
    let(:game) {mock_model(Game).as_null_object}


    before(:each) do
      Game.stub(:new).and_return(game)
    end

    it 'creates a new game' do
      Game.should_receive(:new).and_return(game)
      post :create
    end

    it 'saves the new game' do
      game.should_receive(:save)
      post :create
    end

    it 'redirects to games#show for the new game' do
      post :create
      response.should redirect_to(game_path(game))
    end

  end
  describe 'games#move' do
      let(:game) {Game.create}
    before(:each) do
      #game.stub(:id).and_return(1)
      Game.stub(:find_by_id).and_return(game)
    end
    it 'should send a message to the game specifying the move' do
      #pending "need to figure out why RSpec bugs on these after moving some code to a module."
      game.should_receive(:move).twice
      put :move, square: 5, mover: :player 
    end
    it 'should redirect to the game being played' do
      #pending "need to figure out why RSpec bugs on these after moving some code to a module."
      put :move, square: 5, mover: :player
      response.should redirect_to game_path(game)
    end
  end

end
