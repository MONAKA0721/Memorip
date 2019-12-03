require 'test_helper'

class InquiryMailerTest < ActionMailer::TestCase
  test "inquiry_mail" do
    mail = InquiryMailer.inquiry_mail
    assert_equal "Inquiry mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
