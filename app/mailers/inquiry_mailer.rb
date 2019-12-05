class InquiryMailer < ApplicationMailer
  default from: "info@memorip.net"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: 'お問い合わせありがとうございます。')
  end

  def contact_email(inquiry)
    @inquiry = inquiry
    mail(to: 'memorip1104@gmail.com', subject: 'お問い合わせメールが来ています。')
  end
end
