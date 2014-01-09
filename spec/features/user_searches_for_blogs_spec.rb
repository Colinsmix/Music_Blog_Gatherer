require 'spec_helper'

feature 'Visitor Searches for Blog', %q(
As a visitor
I can search for blogs on the website
So that I can find music that I'm interested in.), js: true do
# Acceptance Criteria
#   - I search for blogs, in a search bar, based on criteria : genre, popularity, author, activity.
#   - I receive data from the website, showing me an organized list of blogs, according to the criteria I specified.
#   - I am able to directly link to a blog from the search results, opening it in a seperate tab of my browser.
  let!(:blog1){ FactoryGirl.create(:blog, tag_list: ['Jazz', 'Rock'], status: 'Verified') }
  let!(:blog2){ FactoryGirl.create(:blog, tag_list: ['Electronic', 'Rock'], status: 'Verified') }
  let!(:blog3){ FactoryGirl.create(:blog, tag_list: ['Jazz', 'Metal'], status: 'Verified') }
  let!(:blog4){ FactoryGirl.create(:blog, tag_list: ['Opera', 'Kpop'], status: 'unverified') }

  scenario 'Visitor enters a tag into the search criteria' do
    visit root_path
    binding.pry
    fill_in 'Search', with: 'Jazz'
    expect(page).to have_content(blog1.name)
    expect(page).to have_content(blog3.name)
    expect(page).to_not have_content(blog2.name)
    expect(page).to_not have_content(blog4.name)

  end

  scenario 'Visitor leaves search field blank' do
    visit root_path
    fill_in 'Search', with: ''

    expect(page).to have_content(blog1.name)
    expect(page).to have_content(blog2.name)
    expect(page).to have_content(blog3.name)
    expect(page).to_not have_content(blog4.name)

  end

  scenario 'Visitor enters a name into the search criteria' do 
    visit root_path
    fill_in 'Search', with: blog1.name

    expect(page).to have_content(blog1.name)
    expect(page).to_not have_content(blog2.name)
    expect(page).to_not have_content(blog3.name)
    expect(page).to_not have_content(blog4.name)

  end


end