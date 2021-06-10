Feature: Update profile
     If I am a registered user
     I want to have the possibility to update my profile data 
     Like: name, surname and telephone number
 

           Scenario: User is not authenticated
                Given I am not authenticated
                When I insert URL: /profilo
                Then I am redirected to the homepage


           Scenario: User is authenticated and he wants to update his profile data adding the telephone
                Given I am authenticated
                When I insert URL: /profilo
                Then I am in Profilo page
                When I click on button 'modifica'
                And I want to add the telephone '321111111'
                When I click on button 'modificasubmit'
                Then the telephone is changed
                
           Scenario: User is authenticated and he wants to update his profile data changing his name
                Given I am authenticated
                When I insert URL: /profilo
                Then I am in Profilo page
                When I click on button 'modifica'
                And I want to change the name to 'Prova1'
                When I click on button 'modificasubmit'
                Then the name is changed
               
          Scenario: User is authenticated and he wants to update his profile data changing his surname
                Given I am authenticated
                When I insert URL: /profilo
                Then I am in Profilo page
                When I click on button 'modifica'
                And I want to change the surname to 'Prova1'
                When I click on button 'modificasubmit'
                Then the surname is changed
                

               
####################################################################################################################         