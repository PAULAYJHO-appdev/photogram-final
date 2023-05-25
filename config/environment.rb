# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#Image upload
require "carrierwave"
require "carrierwave/orm/activerecord"
