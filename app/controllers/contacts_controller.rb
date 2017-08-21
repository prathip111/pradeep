class ContactsController < ApplicationController
  def create
  	@contact = Contact.create(name: params[:name], email: params[:email], subject: params[:subject], message: params[:comment])
  	redirect_to action: "index"
  end

  def index
  	@contacts = Contact.all
  end
end
