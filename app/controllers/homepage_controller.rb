class HomepageController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def sos
         @contact=Contact.new
    end
    
    def contatti
        @form=Form.new

    end
    
    def form_params
        params.require(:form).permit(:firstname,:email,:text)
      end


    def createcontatti
        @form=Form.new(form_params) 
        if (@form.save)
            #send email
           ContattiMailer.avviso_form1(@form).deliver
              
            redirect_to "/contatti"
        
        else
            render :contatti
            
        end

    end

   
    def contact_params
        params.require(:contact).permit(:firstname,:lastname,:email,:tel)
      end

    def createsos
        @contact=Contact.new(contact_params)
        if (@contact.save)
            #send email
           SosMailer.avviso_form(@contact).deliver
              
            redirect_to "/sos"
        
        else
            render :sos
            
        end
        


    end
     
    def profilo
        if (user_signed_in?)
            
        
        elsif (doctor_signed_in?)
           

        else
            redirect_to "/"
        end
    end 
    
end