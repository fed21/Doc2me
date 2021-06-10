Feature: Modifica profilo

           Scenario: User is not authenticated
                Given I am not authenticated
                When I insert URL: /profilo
                Then I am redirected to the homepage


           Scenario: User is authenticated and he wants to update his profile data
                Given I am authenticated
                When I insert URL: /profilo
                Then I am in Profilo page
                When I click on button 'modifica'
                And I change data
                When I click on button 'modificasubmit'
                Then 


               
####################################################################################################################         