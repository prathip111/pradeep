class ContactsController < ApplicationController
  #before_action :authenticate_user, :only => [:index,:create,:destroy]
  def create
  	
  	@contact = Contact.create(name: params[:name], email: params[:email], subject: params[:subject], message: params[:message])
  	UsermailerMailer.mailing(@contact).deliver
  	UsermailerMailer.cusmail(@contact).deliver
  	redirect_to action: "index"
  end

  def index
  	@contacts = Contact.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def destroy
     @contact = Contact.find(params[:format])
     if @contact.delete
     redirect_to action: "index"
    end
  end
  

end
