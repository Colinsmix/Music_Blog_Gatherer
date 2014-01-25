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
  let!(:blog){ FactoryGirl.build(:blog) }
  let!(:blog2){ FactoryGirl.build(:blog) }

  scenario 'Visitor attempts to add a blog without signing in' do
    blog2.save!
    visit root_path
    click_link 'Add a Blog'

    expect(page).to have_content('You need to sign in')
    expect(page).to have_link('Sign In')
  end

  scenario 'Redirects the user to the main page after adding a blog successfully' do
    blog2.save!
    user.save!
    sign_in_as(user)
    visit root_path

    click_link 'Add a Blog'
    fill_in 'Blog Title', with: blog.name
    fill_in 'Website Address', with: blog.url
    fill_in 'A Short Description', with: blog.description
    click_button 'Create Blog'

    expect(page).to have_content('Blog Added!')
    expect(Blog.last.status).to eql('unverified')
    expect(Blog.last.submitter).to eql(user)

  end

  scenario 'User enters a blog with invalid information' do
    blog2.save!
    user.save!
    sign_in_as(user)
    visit root_path
    click_link 'Add a Blog'
    click_button 'Create Blog'

    expect(page).to have_content("can't be blank")
  end
end
