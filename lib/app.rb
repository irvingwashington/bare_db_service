require 'bundler'
Bundler.require

lib = File.expand_path(File.dirname(__FILE__))

require File.join(lib, 'controllers', 'action')
require File.join(lib, 'controllers', 'database_controller', 'index')
require File.join(lib, 'controllers', 'tables_controller', 'index')
require File.join(lib, 'controllers', 'tables_controller', 'show')
require File.join(lib, 'models', 'table')
require File.join(lib, 'models', 'record')
require File.join(lib, '..', 'config', 'routes')
require File.join(lib, '..', 'config', 'database.rb')


module BareDBService

  class App
    attr_reader :router

    def initialize
      autoload_classes
      setup_db
      @router = Routes.new.draw
    end

    def call(*args)
      router.call(*args)
    end

    private

    def setup_db
      ActiveRecord::Base.establish_connection(environment)
    end

    def autoload_classes

    end

    def environment
      @env ||= (ENV['RACK_ENV'] || "development").to_sym
    end

  end
end
