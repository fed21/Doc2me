# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'gmail.com',
    :address => 'smtp.sendgrid.net',
    :port => 587 ,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
  