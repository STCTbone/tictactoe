
Given(/^I am on the homepage$/) do
  visit root_path
  current_path.should == root_path
end

When(/^I click on the New Game link$/) do
  click_link('New Game')
end

Then(/^I see a blank tic tac toe board$/) do
  page.should have_selector('td', count: 9)
end

Then(/^a box saying it's my turn$/) do
  pending # express the regexp above with the code you wish you had
end