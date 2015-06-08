class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'Thank you for your message. We will contact you soon!'
      redirect_to new_contact_path 
    else
      flash[:danger] = 'Error occured, message has not been sent.'
      redirect_to new_contact_path
    end
  end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments, :nickname)    
    end
end