require 'spec_helper'

feature 'User adds a blog to Favorites', %q(
As a user,
I want to bookmark favorite blogs,
So that I can find them in my profile for easy access.) do
# Acceptance Criteria
#  - While searching blogs, I can click a favorite button to add a blog to my favorites.
#  - After adding a blog to my favorites, I can view it in a list on my profile page.
#  - I can remove unwanted favorites from my favorite list by clicking a checkbox. 
  let!(:user){ FactoryGirl.build(:user) }
  let!(:blog1){ FactoryGirl.create(:blog, tag_list: ['Jazz', 'Rock'], status: 'Verified') }

  scenario 'User adds a blog to their favorites' do
    user.save!
    sign_in_as(user)
    visit root_path
    click_link('Favorite this blog')

    expect(page).to have_link('Unfavorite this blog')
  end

  scenario 'User removes a blog from their favorites' do
    user.save!
    sign_in_as(user)
    visit root_path
    click_link('Favorite this blog')
    click_link('Unfavorite this blog')

    expect(page).to have_link('Favorite this blog')
  end

  scenario 'Visitor does not have the option to favorite blogs' do
    visit root_path

    expect(page).to_not have_link('Favorite this blog')
    expect(page).to_not have_link('Unfavorite this blog')
  end 

  scenario 'User can access and remove favorites from their profile page' do
    user.save!
    sign_in_as(user)
    visit root_path
    click_link('Favorite this blog')
    visit user_session_path

    expect(page).to have_content(blog1.name)
    expect(page).to have_link('Remove')
  end
end