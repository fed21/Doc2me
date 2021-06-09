#before executing 'cucumber'delete gem rspec-rails for incompatibility with Cucumber and remember to add it again at the end and run 'bundle install'
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