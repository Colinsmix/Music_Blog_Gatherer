require 'spec_helper'

feature 'User submits a message', %q(
As a site visitor
I want to contact the site's staff
So that I can ask questions or make comments about the site) do
# Acceptance Criteria:
# I must specify a valid email address IF not signed in
# I must specify a subject
# I must specify a description
# I must specify a first name IF not signed in with first name.
# I must specify a last name IF not signed in with last name.
  let!(:user){ FactoryGirl.build(:user) }

  scenario 'Visitor gives valid information, creates message' do
    ActionMailer::Base.deliveries = []

    email = 'colinsmix@gmail.com'
    user.save!
    sign_in_as(user)
    visit root_path
    click_link 'Contact Us'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Subject', with: 'Example Subject'
    fill_in "Tell us More!", with: 'Example Description'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    click_button('Send Message')

    expect(page).to have_content("Message Created Successfully")
    expect(page).to have_link('Add a Blog')

    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Message Received from Music Blog Gatherer')
    expect(last_email).to deliver_to(email)
    expect(last_email).to have_body_text('Example Description')
  end
end
