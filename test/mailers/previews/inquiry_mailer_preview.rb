# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inquiry_mailer/inquiry_mail
  def inquiry_mail
    InquiryMailer.inquiry_mail
  end

end
