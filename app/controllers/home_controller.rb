class HomeController < ApplicationController
  layout 'application'

  def index
  end

  def send_email
    begin
      HomeMailer.with(params).send_email.deliver!
      @errors = nil
    rescue => err
      logger.error err
      @errors = "发送失败"
    end

    respond_to do |format|
      format.js
    end
  end

  def login
  end
end
