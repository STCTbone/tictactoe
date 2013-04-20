require "spec_helper"

describe "games/show.html.erb" do
  context "On launch" do
    before(:each) do
      visit root_path
      click_link "New Game"
    end
    it "should display a tic tac toe board" do
      page.should have_selector('td', count: 9)
    end
    it "should say 'Player 1's turn'" do
      page.should have_content("Player 1's Turn")
    end
  end
  context "Making a move" do
    context "the square is unfilled" do
      it "directs to games#move with params[:square] == the square clicked" do
        visit root_path
        click_link "New Game"
        click_link "square_5"
        current_url.should == current_host + "/games/move?square=5"
      end
    end
  end
end