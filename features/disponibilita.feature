Feature: Disponibilità
    To see the timetables on a certain date
    As a registered user
    I want to have an input for the date to choose
    So that the table is not empty


        Scenario: User is not authenticated
                Given I am not authenticated
                Given I am on the Servizi page
                When I click on "richiedistudio2"
                Then I am redirected to the users login page

        Scenario: User is authenticated and no date inserted
                Given I am authenticated
                Given I am on the Servizi page
                When I click the button "richiedistudio1"
                Then I am on the Disponibilita page
                And I don't see any timetable
                
        Scenario: User is authenticated and date '2030-01-01' is inserted but no visit on that day
                Given I am authenticated
                Given I am on the Servizi page
                When I click the button "richiedistudio1"
                Then I am on the Disponibilita page
                When I insert a date "2030-01-01" without visits on that day
                And I press the submit button
                Then I see the timetables of that day empty

        Scenario: User is authenticated and date '2030-01-02' is inserted and there are visits on that day
                Given Visit on "2030-01-02" hour "18:00"
                Given I am authenticated
                Given I am on the Servizi page
                When I click the button "richiedistudio1"
                Then I am on the Disponibilita page
                When I insert a date "2030-01-02" with visits on that day
                And I press the submit button
                Then I see the timetables of that day not empty


####################################################################################################################



