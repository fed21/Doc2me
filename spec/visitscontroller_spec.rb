require 'rails_helper.rb'

# ***FC*** Description of test on visit controller method "prenotazioni" and "destroy visit", using fixtures defined in 'spec/fixtures'

describe VisitsController, type: :controller do


    context "In page 'prenotazioni' " do
        
        #Import all fixtures
        
        fixtures :all

        #Case 1: unregistered doctor

        it "if you are not a registered doctor it should redirect you to the '/'" do
            
            subject= get :prenotazioni
            
            expect(subject).to redirect_to("/")

        end

        #Case 2.1: registered doctor

        it "if you are a registered doctor with no visits for you it should retrieve your 0 visits"  do
            
            #simulating a doctor with a user fixture 
            doctor = users(:doctor) # use of the fixture doctor
            sign_in doctor  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
            doctor.confirm  #In order to add confirmation_token necessary to add a doctor in our app
            
            get :prenotazioni

            p = Visit.where(:user_id => doctor.id).order(:data_ora) 
            

            expect(p).to be_empty
           

        end

        #Case 2.1: registered doctor

        it "if you are a registered doctor with one visit for you it should retrieve your 1 visit"  do
            
            #simulating doctor with a user fixture 
            doctor = users(:doctor) # use of the fixture doctor
            sign_in doctor  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
            doctor.confirm  #In order to add confirmation_token necessary to add a doctor in our app
            
            get :prenotazioni

            User.create!(:id=>1000, :email=> 'prova3@prova.it', :password => 'prova3')

            Doctor.create!(:id =>1000, :email=> 'prova4doc@prova.it', :password => 'prova4doc')

            Kid.create!(:id =>3, :user_id=>1000)

            Visit.create!(:doctor_id=> 1000, :data_ora=> "2021-07-21 13:00:00.000000000 +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> doctor.id, :kid_id => 3)

            p = Visit.where(:user_id => doctor.id).order(:data_ora) 

           #eq used for a deep equivalence instead of eql
            expect(assigns(:p)).to eq(p)
           

        end

        #Case 3: registered user deleting a visit

        it "if you are a registered user with one visit you can delete it" do
            
             #these three lines are in order to test devise sign_in
             user = users(:user) # use of the fixture user
             sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
             user.confirm #In order to add confirmation_token necessary to add a user in our app
            
             Doctor.create!(:id =>8, :email=> 'prova8@prova8.it', :password => 'prova8')

             Kid.create!(:id =>8, :user_id=>user.id)
 
             Visit.create!(:id =>9, :doctor_id=> 8, :data_ora=> "2021-08-26 17:00:00.000000000 +0000", :tipo_visita=>'studio', :stato_visita=> 'non pagata', :user_id=> user.id, :kid_id => 8)

             delete :destroy, :params => {:format => 9}
             
             visit=Visit.where(:id=>9)
  
             expect(visit).to be_empty


        end 

    end

end 


