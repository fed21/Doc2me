class MedicoeliminavisitaMailer < ActionMailer::Base
    default from: "doc2me.app@gmail.com"
  
    def medicoeliminavisita(email_utente,current_doctor,datareq,hour,tipo)
      @emailutente = email_utente
      @cdoctor = current_doctor
      @datareq = datareq
      @hour = hour
      @tipo=tipo
        
  
      mail to: @emailutente , subject: "AVVISO ANNULLAMENTO VISITA DOC2ME"
      
    end
  end