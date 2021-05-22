class HomepageController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def sos
         @contact=Contact.new
    end
    
    
    def contact_params
        params.require(:contact).permit(:firstname,:lastname,:email,:tel)
      end

    def createsos
        @contact=Contact.new(contact_params)
        if (@contact.save)
            #send email
           SosMailer.avviso_form(@contact).deliver

            redirect_to "/sos" , notice: "OK SALVATA FORM"
        
        else
            render :new
            
        end
        


    end
    
end