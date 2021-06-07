class Formservizi3Mailer < ActionMailer::Base
    default from: "doc2me.app@gmail.com"
  
    def servizi3_form3(emaildoc, current_user, datareq, hour)
      @emaildoc = emaildoc
      @cuser = current_user
      @datareq = datareq
      @hour = hour
        
  
      mail to: @emaildoc , subject: "RICHIESTA VISITA IN STUDIO DOC2ME"
      
    end
  end