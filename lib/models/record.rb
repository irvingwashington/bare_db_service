module BareDBService

  class Record
    attr_reader :orm_obj

    def initialize(orm_obj)
      @orm_obj = orm_obj
    end

    class << self

      def find(table, id)
        new(table.orm.find(id))
      end

      def all(table)
        table.orm.all.map { |obj| new(obj) }
      end

    end

    def as_json(*args)
      @orm_obj.as_json(*args)
    end

  end

end
