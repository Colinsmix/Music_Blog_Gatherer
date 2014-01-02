require 'spec_helper'

feature 'User adds a blog onto the website', %q(
As a user.
I can add a blog onto the website
So that it can be searched for by other users.) do
#  Acceptance Criteria  
# - I enter a blog into a form, storing : Blog Title, Blog URL, Description.
# - If I fail to complete any line of the form, the form will not complete.
# - When I complete the form, the data is stored in the database labeled 'unverified'.
  let!(:user){ FactoryGirl.build(:user) }

scenario 'Visitor attempts to add a blog without signing in' do
  visit root_path
  click_link 'Add a Blog'

  expect(page).to have_content('You need to sign in')
  expect(page).to have_link('Sign In')
end

scenario 'Redirects the user to the main page after adding a blog successfully' do
  user.save!
  sign_in_as(user)
  visit root_path
  click_link 'Add a Blog'
  fill_in 'Name', :with => 'Example Blog' 
  fill_in 'Url', :with => 'www.exampleblog.com'
  fill_in 'Description', :with => 'An example of a blog'
  click_button 'Create Blog'

  expect(page).to have_content('Blog Added!')
end



end