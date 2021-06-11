Given('I am not authenticated') do

   #Don't do nothing to simulate the user is not doing authentication

end

Given('I am on the Servizi page') do
  
   visit "/servizi"

end

When('I click on {string}') do |string|
   
   click_button string
   visit "/users/sign_in"
   
end

Then('I am redirected to the users login page') do

   assert_current_path '/users/sign_in'

end

Given('I am authenticated') do

   u=User.create!(:id=>1, :email=> 'prova@prova.it', :password => 'prova1',:nome=>'Prova',:cognome=> 'Prova')
   u.confirm
   visit "users/sign_in"
   fill_in "email", with: 'prova@prova.it'
   fill_in "password", with: 'prova1'
   click_button "Accedi"
   expect(page).to have_text("Prova Prova utente")

end

When('I click the button {string}') do |string|

   click_button string
   visit "/disponibilita"

end


Then('I am on the Disponibilita page') do

   assert_current_path '/disponibilita'

end

And("I don't see any timetable") do
   
   expect(page.has_table?).to be false
    
end

When('I insert a date {string} without visits on that day') do |string|

   fill_in "date", with: string+" " #date always needs space at the end

end
 
And('I press the submit button') do
      
   click_button "datesubmit"

end
 
Then('I see the timetables of that day empty') do
   
   for i in 9..18 do
   xpath_query="//tbody"
   xpath_query+="/tr[th="+"'"+i.to_s+":00' and td='Disponibile']"
   expect(page).to have_xpath(xpath_query)
   end

end

Given('Visit on {string} hour {string}') do |string, string2|

   User.create!(:id=>2, :email=> 'provaa@prova.it', :password => 'provaa1')

   Doctor.create!(:id =>1, :email=> 'provaa@prova.it', :password => 'provaa1')

   Kid.create!(:id =>1, :user_id=>2)

   Visit.create!(:doctor_id=>1, :data_ora=> string+" "+string2+" "+"+0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 2, :kid_id => 1)

end

When('I insert a date {string} with visits on that day') do |string|

   fill_in "date", with: string+" " #date always needs space at the end

 end

Then('I see the timetables of that day not empty') do
   
   for i in 9..17 do
      xpath_query="//tbody"
      xpath_query+="/tr[th="+"'"+i.to_s+":00' and td='Disponibile']"
      expect(page).to have_xpath(xpath_query)
   end

   xpath_query="//tbody"
   xpath_query+="/tr[th='18:00' and td='Occupato']"
   expect(page).to have_xpath(xpath_query)

 end