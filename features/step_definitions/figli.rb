Then('I do not see any children box') do
    expect(page).to_not have_selector "h1#boxfiglio"
end

Then('I want to see my children') do
    page.find(:css, '#boxfiglio')
end

When('I want to fill the fields: {string}, {string}, {string}, {string}') do |string, string2, string3, string4|
    fill_in "namefiglioadd", with: string
    fill_in "surnamefiglioadd", with: string2
    fill_in "datefiglioadd", with: string3
    fill_in "placefiglioadd", with: string4
end
  
Then('The child is added') do
    expect(page).to have_selector("//h1", :class=>'boxfiglio')
end

Given('I have a child') do
    Kid.create!(:id =>5, :user_id=>1, :name=>'Gianlu', :surname=>'Mancio')
end
  
When('I click on the link: {string}') do |string|
    click_link string
end
  

  