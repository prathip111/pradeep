class UsermailerMailer < ApplicationMailer
default from: 'prathip111@gmail.com'

def mailing(data)
 @user = data
 mail(to: "pradeep.ramachandran@adcltech.com", subject: 'Feedback')
end

def cusmail(data)
 @user = data
 mail(to: @user[:email], subject: "welcome to my site")
end

end
