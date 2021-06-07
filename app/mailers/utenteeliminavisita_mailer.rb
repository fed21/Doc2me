class UtenteeliminavisitaMailer < ActionMailer::Base
    default from: "doc2me.app@gmail.com"
  
    def utenteeliminavisita(email_doc,current_user,datareq,hour,tipo)
      @emaildoc = email_doc
      @cuser = current_user
      @datareq = datareq
      @hour = hour
      @tipo=tipo
        
  
      mail to: @emaildoc , subject: "AVVISO ANNULLAMENTO VISITA DOC2ME"
      
    end
  end