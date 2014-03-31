require 'bundler'
Bundler.require

lib = File.expand_path(File.dirname(__FILE__))

require File.join(lib, 'controllers', 'database_controller', 'index')
require File.join(lib, 'controllers', 'tables_controller', 'index')
require File.join(lib, 'controllers', 'tables_controller', 'show')
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
      ActiveRecord::Base.connection
    end

    def autoload_classes

    end

  end
end
