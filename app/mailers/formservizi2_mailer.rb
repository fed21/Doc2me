class Formservizi2Mailer < ActionMailer::Base
    default from: "doc2me.app@gmail.com"
  
    def servizi2_form2(emaildoc, current_user, ind, datareq, hour)
      @emaildoc = emaildoc
      @cuser = current_user
      @ind = ind
      @datareq = datareq
      @hour = hour
        
  
      mail to: @emaildoc , subject: "RICHIESTA VISITA DOMICILIO DOC2ME"
      
    end
  end