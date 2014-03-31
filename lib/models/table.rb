module BareDBService

  class Table
    attr_reader :table_name, :orm

    class TableNotFound < StandardError; end

    def initialize(name)
      raise TableNotFound, name unless self.class.table_names.include?(name)
      @table_name = name
      @orm = Class.new(ActiveRecord::Base).tap {|c| c.table_name = name } 
    end

    class << self
      def find(name)
        new(name)
      end

      def all
        table_names.map { |table_name| new(table_name) }
      end

      def table_names
        ActiveRecord::Base.connection.tables
      end
    end

    def as_json(*args)
      {}.tap do |hsh|
        @orm.columns.each { |c| hsh[c.name] = c.type }
      end
    end

    def records
      Record.all(self)
    end

  end

end
