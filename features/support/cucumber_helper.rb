def login(email, password)
  click_on 'Log in'
  within("#new_user") do
    fill_in 'Enter Email', with: email
    fill_in 'Password', with: password
    fill_in 'Confirm Password', with: password
  end
  click_button 'Back to store'
end
