class Api::V1::ContactsController < ApplicationController
  def new
    @contact = Contact.new
    render json: @contact

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request # this line is very important to allow deliver_later to work
    if @contact.deliver_later # this puts the job to the ActiveJob queue
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
