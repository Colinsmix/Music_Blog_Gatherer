require 'spec_helper'

feature 'User searches for random blog', %q(
As a visitor
I can search for a random blog
So that I can potentially discover something I haven't heard before.) do 
# Acceptance Criteria
#  - I can click on a button, which can be optionally filtered by genre, to link to a random blog off the website in a seperate tab of my browser.
  
  scenario 'User searches for a random unfiltered blog' do
    visit root_path
    click_button 'Find Random Blog'


  end


end