require 'spec_helper'

feature 'User votes on a Blog', %q(
As a member
I can up and downvote other blogs
So that I have a way of expressing my opinion and recommending blogs to other users.) do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:blog1){ FactoryGirl.create(:blog, tag_list: ['Jazz', 'Rock'], status: 'Verified') }

  scenario 'User enjoys a blog, and upvotes it to show his satisfaction', js: true do
    visit root_path
    sign_in_as(user)
    click_on('Like')

    expect(page).to have_content('1')
  end


  scenario 'User does not enjoy a blog, and downvotes it to show distaste' do



  end

  scenario 'Visitor can not see or vote on blogs without being signed up' do



  end
end
