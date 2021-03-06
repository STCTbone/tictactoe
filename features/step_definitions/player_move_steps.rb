Given(/^I am playing a game and it is my turn$/) do
  visit root_path
  click_link "New Game"
end

When(/^I click on an unoccupied square$/) do
  click_link "square_0"
end

Then(/^that square is filled with an "(.*?)"$/) do |arg1|
  page.should have_selector("td.square_0", text: arg1)
end
