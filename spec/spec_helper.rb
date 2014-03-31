ENV['RACK_ENV'] ||= 'test'

spec_dir = File.expand_path(File.dirname(__FILE__))

require File.join(spec_dir, '..', 'lib', 'app.rb')

ActiveRecord::Base.establish_connection(ENV['RACK_ENV'].to_sym)

ActiveRecord::Migration.create_table :test_table, force: true do |t|
  t.string  :name
  t.integer :foreign_id
  t.timestamps
end