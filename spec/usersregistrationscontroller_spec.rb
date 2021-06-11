require 'rails_helper.rb'

#since it is not possible to isolate that method that is overwritten by Devise, we are going to create a stub to simulate and test the 'update' operation
#The stub is in "lib/updatestub.rb"
require "updatestub.rb"

#Description of test on users/registrations controller method "update" , using fixtures defined in 'spec/fixtures'

describe UpdateStub do

    context "In page 'profilo' in order to update the profile" do

        #Create UpdateStub object
        before do
            
            @obj= UpdateStub.new()

        end
        #Import all fixtures
            
        fixtures :all

        #Case 1: unregistered user : it is not possibile to reach "profilo" page if he is not registered and so authenticated

        describe HomepageController, type: :controller do
            
            it "if you are not a registered user it should redirect you to the '/'" do
                
                subject= get :profilo
                
                expect(subject).to redirect_to("/")

            end
            
        end
            #Case 2: registered user
            
            it "if you are a registered user you can update your profile" do
                
                #this is to simulate sign_in (we are using a stub)
                User.create!(:id=>500, :email=> 'prova9@prova9.it', :password => 'prova9',:nome=> "prova",:cognome => "prova", :telefono=> 3213213212)
                
                #since it is not possible to isolate that method that is overwritten by Devise, we are going to create a stub to simulate and test the 'update' operation
                @obj.updatesimulated("prova","prova",1323213211)
                
                
                updated=User.where(nome: "prova" , cognome: "prova")

                expect(@obj.redirection). to eql "profilo"

                #eq used for a deep equivalence instead of eql
                expect(updated). to_not be_empty
                
                #!! comment line 43 and 48 to see that the telephone is not changed from 3213213212 and set line 51 to "expect(updated). to eql ("prova") to see the telephone number



            end
       



    end
end