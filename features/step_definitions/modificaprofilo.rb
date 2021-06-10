When('I insert URL: \/profilo') do
   visit '/profilo'
  end

Then('I am in Profilo page') do
    assert_current_path '/profilo'
end

When('I click on button {string}') do |string|
    click_button string
end

Then('I want to change data') do
    
    fill_in "telefono", with: '3211111111'

end
  
Then('funziona') do
    telephone=page.find_field("telefono").value
    expect(telephone). to eql '3211111111'
end
  