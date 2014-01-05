require 'spec_helper'

feature 'Admin Classifies and Tags Blogs', %q(
As an admin
I can classify and tag blogs added by users
So that users have an easy and convenient way of searching for new music.) do
# Acceptance Tests
# - I verify the data forms stored in the pending database, sending them to the tagging database.
# - I tag the data forms stored in the tagging database, according to genre, and then sent to the finished database.
  let!(:user){ FactoryGirl.build(:user) }

  scenario 'Regular Users cannot see the verification page' do 
    user.save!
    sign_in_as(user)
    visit root_path

    expect(page).to_not have_link('Verify Blogs')
  end

  scenario 'Admins can access the verification page' do
    user.role = 'Admin'
    user.save!
    sign_in_as(user)
    visit root_path

    expect(page).to have_link('Verify Blogs')
  end

  
end
