class Api::V1::ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request

    if @contact.deliver
      # Mover el renderizado de la respuesta JSON después de que el correo se haya entregado exitosamente
      head :created
    else
      # Si el correo no se entrega correctamente, renderizar errores JSON
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
