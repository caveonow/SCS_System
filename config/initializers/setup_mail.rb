#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#  :address              =>  'smtp.sendgrid.net',
#  :port                 =>  '587',
#  :authentication       =>  :plain,
#  :user_name            =>  'app57772936@heroku.com',
#  :password             =>  'fe6967j50597',
#  :domain               =>  'heroku.com',
#  :enable_starttls_auto  =>  true
#}

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name      => ENV['app57772936@heroku.com'],
  :password       => ENV['fe6967j50597'],
  :domain         => ENV['heroku.com']
}