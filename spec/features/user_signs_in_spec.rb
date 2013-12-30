require 'spec_helper'

feature 'User signs up for the website', %q(
As a visitor
I can register to the website
So that I can save favorite blogs, and vote on blogs.
- I enter information into a form, giving the following information : Name, Email Address.
- If I fail to complete either line of the form, the form will not complete.
- When I complete the form, I am able to access a favorites section, and vote on blogs.) do
  let!(:user){ FactoryGirl.build(:user) }

  context 'Signing Up' do

    scenario 'Redirects the user to the profile page after sign up' do
      visit "/users/sign_up"
      fill_in "Email", :with => "example@example.com"
      fill_in "Password", :with => "passwordtest", :match => :prefer_exact
      fill_in "Password confirmation", :with => "passwordtest", :match => :prefer_exact
      click_button "Sign up"
      expect(page).to have_content("Welcome, example@example.com")
    end
  end

  context 'Signing in' do

    scenario 'I see my profile page if signed in on an account without a name' do
      sign_in_as(user)
      expect(page).to have_content("Welcome, #{user.email}")
    end

    scenario 'I see my profile page if signed in on an account with a name' do
      user = FactoryGirl.build(:user, :with_name)
      user.save!
      sign_in_as(user)
      expect(page).to have_content("Welcome, #{user.first_name} #{user.last_name}")
    end

  end

  context 'Forgetting your password' do 
     
    scenario "recover password" do
    visit "/users/sign_in"
    user.save!
    click_link "Forgot your password?"
    fill_in "Email", :with => user.email
    click_button "Send me reset password instructions"
    unread_emails_for(user.email).should be_present
    end
  end
end