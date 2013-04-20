require "spec_helper"

describe "games/show.html.erb" do
  it "should display a tic tac toe board" do
    visit root_path
    click_link "New Game"
    page.should have_selector('td', count: 9)
  end
  it "each square should be wrapped in a link" do
    visit root_path
    click_link "New Game"
    page.should have_selector('a+td', count: 9)
  end
end