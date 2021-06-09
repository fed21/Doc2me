require 'rails_helper.rb'

# ***FC*** Description of test on homepage controller , using fixtures defined in 'spec/fixtures'

describe HomepageController, type: :controller do
    
    context "In page 'disponibilità'" do
   
    #Since the controller makes a query to the db we have to create in testing db a visit in that date, automatically cleared by dbcleaner (see RAILS_ENV=test rails c and the tables of the db in testing env empty ath the end of the testing)
    before (:all) do
     
        User.create!(:id=>1, :email=> 'prova@prova.it', :password => 'prova1')

        Doctor.create!(:id =>1, :email=> 'prova@prova.it', :password => 'prova1')

        Kid.create!(:id =>1, :user_id=>1)

        Visit.create!(:doctor_id=> 1, :data_ora=> "2021-07-21 10:00:00.000000000 +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 1, :kid_id => 1)

        Visit.create!(:doctor_id=> 1, :data_ora=> "2021-07-21 12:00:00.000000000 +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 1, :kid_id => 1)

        Visit.create!(:doctor_id=> 1, :data_ora=> "2021-07-22 10:00:00.000000000 +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 1, :kid_id => 1)

        Visit.create!(:doctor_id=> 1, :data_ora=> "2021-07-24 18:00:00.000000000 +0000", :tipo_visita=>'online', :stato_visita=> 'non pagata', :user_id=> 1, :kid_id => 1)
    end

    #Import all fixtures
    
    fixtures :all

    #Case 1: unregistered user

    it "if you are not a registered user it should redirect you to the 'new_user_session_path'" do
        
        subject= get :disponibilita
        
        expect(subject).to redirect_to(new_user_session_path)

    end

    #Case 2: registered user but no date inserted
  
    it  "if you are a registered user but no data is send  it should not set any occupied hours from database" do
       
        #these three lines are in order to test devise sign_in

        user = users(:user1) # use of the fixture user1
        sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
        user.confirm #In order to add confirmation_token necessary to add a user in our app

        #otherwise we could use the following line instead of the last two in order to manipulate user_signed_in control without sign_in
        #allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)
        
        get :disponibilita  

        
        expect(assigns(:occupati)).to eql(nil)

    end
    
    #Case 3.1: registered user with date inserted
    
    it  "if you are a registered user and data 2021-07-21 is sent it should set occupied hours 10 and 12 from database" do
       
        
        #these three lines are in order to test devise sign_in

        user = users(:user1) # use of the fixture user1
        sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
        user.confirm #In order to add confirmation_token necessary to add a user in our app

        #otherwise we could use the following line instead of the last two in order to manipulate user_signed_in control without sign_in
        #allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)

        get :disponibilita, :params => {:date => "2021-07-21 "}  #Space at the end of the date is necessary to append the hour in the controller

       
        expect(assigns(:occupati)).to eql([10,12])

    end

    #Case 3.2: registered user with date inserted

    it  "if you are a registered user and data 2021-07-24 is sent it should set occupied hour 18 from database" do
       
          
        #these three lines are in order to test devise sign_in

        user = users(:user1) # use of the fixture user1
        sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
        user.confirm #In order to add confirmation_token necessary to add a user in our app

        #otherwise we could use the following line instead of the last two in order to manipulate user_signed_in control without sign_in
        #allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)

        get :disponibilita, :params => {:date => "2021-07-24 "}  #Space at the end of the date is necessary to append the hour in the controller

       
        expect(assigns(:occupati)).to eql([18])

    end

    #Case 3.3: registered user with date inserted

    it  "if you are a registered user and data 2021-07-22 is sent it should set occupied hour 10 from database" do
       
             
        #these three lines are in order to test devise sign_in

        user = users(:user1) # use of the fixture user1
        sign_in user  #helper method given by 'config.include Devise::Test::ControllerHelpers, :type => :controller' in 'rails_helper'
        user.confirm #In order to add confirmation_token necessary to add a user in our app

        #otherwise we could use the following line instead of the last two in order to manipulate user_signed_in control without sign_in
        #allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)
       

        get :disponibilita, :params => {:date => "2021-07-22 "}  #Space at the end of the date is necessary to append the hour in the controller

       
        expect(assigns(:occupati)).to eql([10])

    end
end 

end