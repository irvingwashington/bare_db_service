module BareDBService

  module TablesController

    class Show < Action
      include Lotus::Action

      def call(params)
        self.content_type = 'application/json'
        table = Table.find(params[:table_name])
        p params
        record = Record.find(table, params[:record_id])
        self.status = 200
        self.body = record.to_json
      rescue Table::TableNotFound
        self.status = 404
        self.body = {:error => "Table not found"}.to_json
      rescue ActiveRecord::RecordNotFound
        self.status = 404
        self.body = {:error => "Record not found"}.to_json
      end
    end

  end

end
