require 'spec_helper'

feature 'User signs up for the website', %q(
As a visitor
I can register to the website
So that I can save favorite blogs, and vote on blogs.) do
# - I enter information into a form, giving the following information : Name, Email Address.
# - If I fail to complete either line of the form, the form will not complete.
# - When I complete the form, I am able to access a favorites section, and vote on blogs.

  context 'Signing Up' do

    scenario 'Redirects the user to the blog search after sign up' do
      visit root_path
      click_link 'Sign Up'
      fill_in "Email", :with => "example@example.com"
      fill_in "Password", :with => "passwordtest", :match => :prefer_exact
      fill_in "Password confirmation", :with => "passwordtest", :match => :prefer_exact
      click_button "Sign Up Now"

      expect(page).to have_content("Thanks for Signing Up!")
    end
  end
end
