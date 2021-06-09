Given('I am not authenticated') do
   #Don't do nothing to simulate the user is not doing authentication
end

Given('I am on the Servizi page') do
   visit "/servizi"
end

When('I click on {string}') do |string|
   click_button(string)
   visit "/users/sign_in"
   
  end

Then('I am redirected to the users login page') do
    assert URI.parse(current_url).path =='/users/sign_in'
    
end

