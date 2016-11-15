ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'app57772936@heroku.com',
  :password             =>  'fe6967j50597',
  :domain               =>  'herokuapp.com',
  :enable_starttls_auto  =>  true
}

