Feature: Double access point
    If I am an unregistered user on the login page of the doctors
    I want to click on the link : Non sei un medico, clicca qui per effettuare il login
 
        Scenario: From the doctors login page to that of the users
                Given I am not authenticated
                Given I am on the doctors login page
                When I click on the link "loginuser"
                Then I am redirected to the users login page

####################################################################################################################