require 'spec_helper'

feature 'User signs up for the website' do
#   As a visitor
# I can register to the website
# So that I can save favorite blogs, and vote on blogs.
#   - I enter information into a form, giving the following information : Name, Email Address.
#   - If I fail to complete either line of the form, the form will not complete.
#   - When I complete the form, I am able to access a favorites section, and vote on blogs.

  it 'requires an email' do
    visit "/users/sign_up"
    fill_in "Password", :with => "passwordtest", :match => :prefer_exact
    fill_in "Password confirmation", :with => "passwordtest", :match => :prefer_exact
    click_button "Sign up"
    expect(page).to have_content("can't be blank")
  end

  it 'requires a password' do
    visit "/users/sign_up"
    fill_in "Email", :with => "example@example.com"
    click_button "Sign up"
    expect(page).to have_content("can't be blank")
  end

  it 'Redirects the user to the profile page after sign up' do
    visit "/users/sign_up"
    fill_in "Email", :with => "example@example.com"
    fill_in "Password", :with => "passwordtest", :match => :prefer_exact
    fill_in "Password confirmation", :with => "passwordtest", :match => :prefer_exact
    click_button "Sign up"
    expect(page).to have_content("Welcome, example@example.com")
  end
end