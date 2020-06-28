class ContactMailer < ApplicationMailer
    default from: 'kumusha@flixtechs.co.zw'

    def contact_email
      @name = params[:name]
      @email = params[:email]
      @phone = params[:phone]
      @message = params[:message]
      mail(to: 'givenyslim12@gmail.com,kumusha.propertieszw@yahoo.com', subject: 'Mail From Kumusha Properties')
    end
end
