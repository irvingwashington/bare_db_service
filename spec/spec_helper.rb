ENV['RACK_ENV'] ||= 'test'

spec_dir = File.expand_path(File.dirname(__FILE__))

require File.join(spec_dir, '..', 'lib', 'app.rb')
