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
    it "each square should be wrapped in a link" do
      page.should have_selector('a+td', count: 9)
    end
    it "should say 'Player 1's turn'" do
      page.should have_content("Player 1's Turn")
    end
  end

end