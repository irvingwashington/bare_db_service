module BareDBService
  module DatabaseController

    class Index < Action
      include Lotus::Action

      def call(params)
        self.status = 200
        self.body = Table.all.map { |t| {t.table_name => t.as_json} }.to_json
        self.content_type = 'application/json'
      end

    end

  end
end
