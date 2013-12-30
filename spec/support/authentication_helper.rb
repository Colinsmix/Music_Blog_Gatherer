module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end
  
  def sign_out
    visit root_path
    click_on 'Sign Out'
  end
end