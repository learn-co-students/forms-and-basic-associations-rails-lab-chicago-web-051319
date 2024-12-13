# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
