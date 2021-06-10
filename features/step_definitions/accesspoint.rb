Given('I am on the doctors login page') do

    visit "/doctors/sign_in"
    
end

When('I click on the link {string}') do |string|

    click_link string
    assert_current_path '/users/sign_in'
    
end