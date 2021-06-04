class SosMailer < ActionMailer::Base
  default from: "doc2me.app@gmail.com"

  def avviso_form(contact)
    @contact=contact

    mail to: "doc2me.app@gmail.com" , subject: "SOS DOC2ME"
    
  end
end
