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
  