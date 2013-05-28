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
  context 'Making a move' do
    context 'the square is unfilled' do
      it 'directs to games#move with params[:square] == the square clicked' do
        pending 'need to learn XPath to do this right'
      end 
      it 'should update with the latest moves' do
        click_link 'square_5'
        page.should have_selector('td#square_5', text: 'O')
      end
    end
    context 'the square is already filled' do
      it 'the square should not be clickable' do
        click_link 'square_0'
        page.should_not have_selector('a#square_0')
      end
    end
  end
end