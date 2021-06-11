Given('a visit for the user on {string}') do |string|
    Doctor.create!(:id=>4, :email=> 'prova4@prova.it', :password => 'prova4',:nome => 'Prova',:cognome => 'Prova')
    Kid.create!(:id =>5, :user_id=>1, :name=>'Prova', :surname=>'Prova')
 
    Visit.create!(:doctor_id=>4, :data_ora=> string+" +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 1, :kid_id => 5)
end
  
Then('I see my visit') do
    xpath_query="//tbody"
    xpath_query+="/tr[td='Prova Prova' and td='Prova Prova' and td='01-01-2030' and td='11:00']"
    expect(page).to have_xpath(xpath_query)
end
  
  Then('I want to drop it') do
    click_link 'Annulla visita'
    xpath_query="//tbody"
    xpath_query+="/tr[td='Prova Prova' and td='Prova Prova' and td='01-01-2030' and td='11:00']"
    expect(page).to_not have_xpath(xpath_query)
end