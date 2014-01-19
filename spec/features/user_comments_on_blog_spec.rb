require 'spec_helper'

feature 'User Comments on a Blog', %q(
As a user
I can comment on a blog
So that I can share my likes/dislikes about it.) do
# Acceptance Criteria
#  - I can click on a blog within the blogs table to view and create comments.
  let!(:user){ FactoryGirl.build(:user) }
  let!(:blog1){ FactoryGirl.create(:blog, tag_list: ['Jazz', 'Rock'], status: 'Verified') }


  scenario 'User comments on a blog' do
    user.save!
    sign_in_as(user)
    visit root_path
    click_on "search"
    fill_in "search", with: 'Jazz'
    click_link('Comments')
    click_link('Add Comment')
    fill_in "Comment", with: 'This is a comment example'

    expect(page).to have_content('This is a comment example')
    expect(page).to have_content('Comment Example 1')
    expect(page).to have_content('Comment Example 2')
  end
end
