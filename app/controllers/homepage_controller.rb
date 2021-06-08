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
              
            redirect_to "/sos" ,notice: "Sos inviato con successo. Un nostro medico ti ricontatterà al più presto!"
        
        else
            render :sos , notice: "Ops qualcosa è andato storto. Riprova."
            
        end
        


    end
     
    def profilo
        if (user_signed_in?)
            @user=current_user
            
            
        
        elsif (doctor_signed_in?)
           

        else
            redirect_to "/"
        end
    end 


    def disponibilita
        #se non sei un utente registrato (visitatore o dottore) sia nella get che nella post(eventualmente simulata con programmi esterni) vieni reindirizzato al login
        if (! user_signed_in?)
             redirect_to new_user_session_path   #helper method ruby
        end
    
        if params[:date]==nil
            @occupati = nil
        else
            datapass = params[:date]
            datamin = datapass+(" 00:00:00")
            datamax = datapass+(" 23:59:59")
            @occupati = Visit.where('data_ora <= ? AND data_ora >= ?', datamax, datamin)
            @occupati = @occupati.map {|x| x.data_ora.hour}
        end
    
    end
    
end