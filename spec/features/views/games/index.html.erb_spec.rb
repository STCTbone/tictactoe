require 'spec_helper'


feature 'index.html' do
  it "displays a 'New Game' link" do
    visit root_path
    page.should have_selector('a', text: 'New Game')
  end
end