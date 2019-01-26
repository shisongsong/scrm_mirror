class HomeMailer < ApplicationMailer
  def send_email
    @name = params[:name]
    @tel = params[:tel]
    @msg = params[:msg]

    #返回mail对象
    mail(
      :subject => params[:subject],
      :to => Rails.configuration.x.default_to,
      :date => Time.now
    )
  end
end
