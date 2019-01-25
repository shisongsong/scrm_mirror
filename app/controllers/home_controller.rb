class HomeController < ApplicationController
  layout 'application'

  def index
  end

  def send_email
    if msg = HomeMailer.with(params).send_email.deliver
p msg
      @errors = nil
    else
      @errors = "发送失败"
    end

    respond_to do |format|
      format.js
    end
  end
end
