require 'rails_helper.rb'

#Description of test on visit controller method "create and destroy", using fixtures defined in 'spec/fixtures'

describe KidsController, type: :controller do
    

    context "In page 'profilo'" do
        #Import all fixtures
                    
        fixtures :all
       

        it "As a registered user I want to add a child if it does not exist" do

           #these three lines are in order to test devise sign_in
            user = users(:user) # use of the fixture user
            sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
            user.confirm #In order to add confirmation_token necessary to add a user in our app
           

            post :create, :params => {:user_id => user.id, :kid =>{:name => 'Prova', :surname => 'Prova', :sesso => 'Maschio'}}
            
            son=user.kids.where('kids.name = ? AND kids.surname = ?','Prova', 'Prova')

            expect(son).to_not be_empty
            
            #if the child exists : redirection

            subject= post :create, :params => {:user_id => user.id, :kid =>{:name => 'Prova', :surname => 'Prova', :sesso => 'Maschio'}}
            
            expect(subject).to redirect_to(profilo_path(user))

        end

        it "As a registered user I want to delete a child if it does not exist" do

            #these three lines are in order to test devise sign_in
            user = users(:user) # use of the fixture user
            sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
            user.confirm #In order to add confirmation_token necessary to add a user in our app
            
            Kid.create!(:id =>10, :user_id=>user.id,:name => 'Prova1', :surname => 'Prova1')
            
            delete :destroy, :params => {:user_id => user.id, :format => 10}
             
            son=user.kids.where('kids.name = ? AND kids.surname = ?','Prova1', 'Prova1')
 
            expect(son).to be_empty
             
            
 
        end
 



        

    end
        
end