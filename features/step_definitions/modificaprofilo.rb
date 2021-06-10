When('I insert URL: \/profilo') do
   
    visit '/profilo'

end

Then('I am in Profilo page') do

    assert_current_path '/profilo'

end

When('I click on button {string}') do |string|

    click_button string

end

Then('I want to add the telephone {string}') do |string|
    
    fill_in "telefono", with: string

end
  
Then('the telephone is changed') do

    telephone=page.find_field("telefono").value
    expect(telephone). to eql '321111111'

end

When('I want to change the name to {string}') do |string|

    fill_in "newname", with: string

end
  
Then('the name is changed') do

    newname=page.find_field("newname").value
    expect(newname). to eql 'Prova1'

end

When('I want to change the surname to {string}') do |string|

    fill_in "newsurname", with: string

end
  
  Then('the surname is changed') do

    newsurname=page.find_field("newsurname").value
    expect(newsurname). to eql 'Prova1'

end