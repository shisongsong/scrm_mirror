class HomeMailer < ApplicationMailer
  def send_email
    @name = params[:name]
    @tel = params[:tel]
    @msg = params[:msg]

    #返回mail对象
    mail(:subject => params[:subject], :to => "shi1400875096@outlook.com", :date => Time.now)   
  end
end
