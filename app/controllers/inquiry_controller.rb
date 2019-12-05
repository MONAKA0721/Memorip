class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    InquiryMailer.contact_email(@inquiry).deliver
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
