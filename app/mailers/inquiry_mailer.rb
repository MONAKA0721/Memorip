class InquiryMailer < ApplicationMailer
  # class InquiryMailer < ActionMailer::Base
    # これ入れないと送れいない。
    default from: "info@heroku.com"
    # default to: "memorip1104@gmail.com"
    # mail(to: @inquiry.email, を入れたのでいらないかも。

    def received_email(inquiry)
      @inquiry = inquiry
      # mail(to: @inquiry.email, :subject => 'お問い合わせありがとうございます。')
      mail(to: @inquiry.email, subject: 'お問い合わせありがとうございます。')
      mail(to: 'memorip1104@gmail.com', subject: 'お問い合わせメールが来ています。')
    end
  end
