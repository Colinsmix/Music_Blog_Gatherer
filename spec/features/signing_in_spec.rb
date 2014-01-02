require 'spec_helper'

feature 'User signs into the website', %q(
As a user
I can log into the website
So that I can see my favorite blogs, vote on blogs, and submit a blog.) do
# - I enter my Email address and Password into a form.
# - If I fail to complete the form, I will not Sign In.
# - When I complete the form, I am able to access a favorites section, vote on blogs, and submit a blog.
  let!(:user){ FactoryGirl.build(:user) }

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
    visit root_path
    click_link 'Sign In'
    user.save!
    click_link "Forgot your password?"
    fill_in "Email", :with => user.email
    click_button "Send me reset password instructions"
    unread_emails_for(user.email).should be_present
    end
  end
end