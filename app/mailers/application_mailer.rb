class ApplicationMailer < ActionMailer::Base
  default from: 's.pan@foxmail.com'
  #default from: 'energypantry_dev@163.com'
  layout 'mailer'
end
