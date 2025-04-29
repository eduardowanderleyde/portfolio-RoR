class ContactMailer < ApplicationMailer
  def contact_email(contact_message)
    @contact_message = contact_message
    
    mail(
      to: "seu-email@exemplo.com",
      from: @contact_message.email,
      subject: "Nova mensagem de contato de #{@contact_message.name}"
    )
  end
end 