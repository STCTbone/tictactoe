require 'spec_helper'

describe 'games/show.html.erb' do
    before(:each) do
      visit root_path
      click_link 'New Game'
    end
  context 'On launch' do
    it 'should display a tic tac toe board' do
      page.should have_selector('td', count: 9)
    end
  end
  context 'Making a move', js: true  do
    context 'the square is unfilled' do
      it 'should update with the latest moves' do
        click_link 'square_0'
        page.should have_selector('td.square_0', text: 'O')
      end
    end
    context 'the square is already filled' do
      it 'the square should not be clickable' do
        click_link 'square_0'
        page.should_not have_selector('a.square_0')
      end
    end
  end
end
