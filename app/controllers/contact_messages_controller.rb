class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.save
      # Envia o e-mail
      ContactMailer.contact_email(@contact_message).deliver_later
      
      redirect_to root_path, notice: 'Mensagem enviada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :message)
  end
end
