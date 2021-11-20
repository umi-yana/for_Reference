class ContactsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @contact = Contact.new
  end


  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:contact_email,
                  :contact_name,
                  :contact_phone_number,
                  :contact_subject,
                  :contact_message
                 )
  end
end
