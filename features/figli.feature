Feature: Update profile
     If I am a registered user
     And I have some children
     I want to manage them

        Scenario: User is not authenticated
                Given I am not authenticated
                When I insert URL: /profilo
                Then I am redirected to the homepage

        Scenario: Doctor is authenticated
                Given I am authenticated as doctor
                When I insert URL: /profilo
                Then I am in Profilo page
                And I do not see any children box

        Scenario: User is authenticated and he has no children
                Given I am authenticated
                When I insert URL: /profilo
                Then I am in Profilo page
                And I do not see any children box

        Scenario: User is authenticated and he has some children, he wants to see them
                Given I am authenticated
                Given I have a child
                When I insert URL: /profilo
                Then I am in Profilo page
                And I want to see my children

        Scenario: User is authenticated and he wants to add a child
                Given I am authenticated
                When I insert URL: /profilo
                Then I am in Profilo page
                When I click on button 'addchild'
                And I want to fill the fields: 'Gianlu', 'Mancio', '2020-07-22', 'Roma'
                When I click on button 'savenewchild'
                Then The child is added


        Scenario: User is authenticated and he wants to drop a child
                Given I am authenticated
                Given I have a child
                When I insert URL: /profilo
                Then I am in Profilo page
                When I click on the link: 'Elimina Figlio'
                Then I do not see any children box
                
                


####################################################################################################################