class ContattiMailer < ActionMailer::Base
    default from: "doc2me.app@gmail.com"
  
    def avviso_form1(form)
      @form=form
  
      mail to: "doc2me.app@gmail.com" , subject: "FORM CONTATTI DOC2ME"
      
    end
  end