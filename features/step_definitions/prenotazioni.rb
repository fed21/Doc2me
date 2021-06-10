When('I insert URL: \/prenotazioni') do
    visit "/prenotazioni"
end
  
Then('I am redirected to the homepage') do
    assert_current_path '/'
end

Then('I am in Prenotazioni page') do
    assert_current_path '/prenotazioni'
end

Then("I do not see any visits") do
    xpath_query="//tbody/tr"  #no rows in table
    expect(page).to_not have_xpath(xpath_query)
end     

Given('I am authenticated as doctor') do

   u=Doctor.create!(:id=>4, :email=> 'prova4@prova4.it', :password => 'prova4',:nome=>'Prova4',:cognome=> 'Prova4')

   visit "doctors/sign_in"
   fill_in "email", with: 'prova4@prova4.it'
   fill_in "password", with: 'prova4'
   click_button "Accedi"
   expect(page).to have_text("Prova4 Prova4 dottore")

end

Given('two visits for the doctor on {string} and {string}') do |string, string2|

    User.create!(:id=>5, :email=> 'prova5@prova.it', :password => 'prova5')
    
    Kid.create!(:id =>5, :user_id=>5, :name=>'Prova', :surname=>'Prova')
 
    Visit.create!(:doctor_id=>4, :data_ora=> string+" +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 5, :kid_id => 5)
    Visit.create!(:doctor_id=>4, :data_ora=> string2+" +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 5, :kid_id => 5)

end
  
Then('I see my visits') do
     
    xpath_query="//tbody"
    xpath_query+="/tr[td='Prova Prova' and td='prova5@prova.it' and td='01-01-2030' and td='11:00']"
    expect(page).to have_xpath(xpath_query)

    xpath_query="//tbody"
    xpath_query+="/tr[td='Prova Prova' and td='prova5@prova.it' and td='01-01-2030' and td='12:00']"
    expect(page).to have_xpath(xpath_query)

end   

