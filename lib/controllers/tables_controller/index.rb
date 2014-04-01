module BareDBService

  module TablesController

    class Index < Action
      include Lotus::Action

      def call(params)
        self.content_type = 'application/json'
        table = Table.find(params[:table_name])
        records = table.records
        self.status = 200
        self.body = records.to_json
      rescue Table::TableNotFound
        self.status = 404
        self.body = {:error => "Table not found"}.to_json
      end

    end

  end

end
