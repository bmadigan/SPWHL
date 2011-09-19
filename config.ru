# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Soopeewee::Application

Soopeewee::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[SPWError] ",
  :sender_address => %{"notifier" <donotreply@soopeewee.com>},
  :exception_recipients => %w{bradmadigan@gmail.com}