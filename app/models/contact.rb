class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w.%+-]+)@([\w-]+\.)+(\w{2,})\z/i
  attribute :message, validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'Contact Form Inquiry',
      to: 'gustavoporcilio@gmail.com',
      reply_to: "#{name} <#{email}>",
      body: "Message send it from web site:\n
             Message:\n
              #{message}\n\n\n\n
             *************************************************************\n
             *  Name: #{name}\n
             *  Email contact: #{email}\n
             *************************************************************\n"
    }
  end
end
