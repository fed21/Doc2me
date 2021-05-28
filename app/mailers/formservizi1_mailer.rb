class Formservizi1Mailer < ActionMailer::Base
    default from: "doc2me.app@gmail.com"
  
    def servizi1_form1(emaildoc, current_user, datareq, hour)
      @emaildoc = emaildoc
      @cuser = current_user
      @datareq = datareq
      @hour = hour
        
  
      mail to: @emaildoc , subject: "RICHIESTA VISITA ONLINE DOC2ME"
      
    end
  end