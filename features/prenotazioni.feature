Feature: Prenotazioni

           Scenario: Doctor is not authenticated
                Given I am not authenticated
                When I insert URL: /prenotazioni 
                Then I am redirected to the homepage


           Scenario: Doctor is authenticated and he has no visits
                Given I am authenticated as doctor
                When I insert URL: /prenotazioni 
                Then I am in Prenotazioni page
                And I do not see any visits
               
           Scenario: Doctor is authenticated and he has 2 visits
                Given I am authenticated as doctor
                Given two visits for the doctor on "2030-01-01 11:00" and "2030-01-01 12:00"
                When I insert URL: /prenotazioni 
                Then I am in Prenotazioni page
                And I see my visits
            

####################################################################################################################