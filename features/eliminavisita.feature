Feature: Delete Visit
     If I am a registered user
     I want to delete a visit that I booked

        Scenario: User is not authenticated
                Given I am not authenticated
                When I insert URL: /prenotazioni 
                Then I am redirected to the homepage

         Scenario: User is authenticated and he has no visits
                Given I am authenticated
                When I insert URL: /prenotazioni 
                Then I am in Prenotazioni page
                And I do not see any visits
        
          Scenario: Doctor is authenticated and he has 2 visits
                Given I am authenticated
                Given a visit for the user on "2030-01-01 11:00"
                When I insert URL: /prenotazioni 
                Then I am in Prenotazioni page
                And I see my visit
                And I want to drop it

       
                


####################################################################################################################