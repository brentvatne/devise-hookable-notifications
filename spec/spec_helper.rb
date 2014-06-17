require 'pry'
require 'rspec'
require 'active_record'
require 'nulldb_rspec'

ActiveRecord::Base.establish_connection adapter: :nulldb,
  schema: File.join(File.dirname(File.expand_path(__FILE__)), '/schema.rb')

require 'devise'
Devise.setup do |config|
  require 'devise/orm/active_record'
end

require_relative '../lib/devise-hookable-notifications'
