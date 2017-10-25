module Api
  module V1
  	class ContactsController < ApplicationController
    def create
  	  @contact = Contact.create(name: params[:name], email: params[:email], subject: params[:subject], message: params[:comment])
      data = params
      UsermailerMailer.mailing(data).deliver
      UsermailerMailer.cusmail(data).deliver
  	  render json: @contact
    end

    def index
  	  @contact = Contact.all
    end
end
  end
end