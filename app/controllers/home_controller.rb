class HomeController < ApplicationController
  layout 'application'

  def index
  end

  def send_email
    @errors = nil
    begin
      HomeMailer.with(params).send_email.deliver!
    rescue => err
      logger.error err
      @errors = "服务器繁忙，请稍后再试"
    end

    respond_to do |format|
      format.js
    end
  end

  def login
  end
end
