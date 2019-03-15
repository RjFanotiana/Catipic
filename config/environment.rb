# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings =   {
	:address              => "smtp.gmail.com",
	:port                 => 587,
	:user_name            => 'contact.catipic@gmail.com',
	:password             => 'catipic2019',
	:authentication       => 'plain',
	:enable_starttls_auto => true
}
