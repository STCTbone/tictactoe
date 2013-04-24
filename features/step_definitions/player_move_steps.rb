Given(/^I am playing a game and it is my turn$/) do
  visit root_path
  click_link "New Game"
  page.should have_content "Player 1's Turn"
end

When(/^I click on an unoccupied square$/) do
  click_link "square_5"
end

Then(/^that square is filled with an "(.*?)"$/) do |arg1|
  page.should have_selector("a#square_5", text: "O")
end
