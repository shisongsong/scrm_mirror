class HomeMailer < ApplicationMailer
  def send_email
    @name = params[:name]
    @tel = params[:tel]
    @msg = params[:msg]

    #返回mail对象
    mail(
      :subject => params[:subject],
      #:to => "enquiry@fargowealth.com.hk",
      :to => "1400875096@qq.com",
      :date => Time.now
    )
  end
end
