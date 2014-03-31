module BareDBService

  class Routes

    def draw
      @routes ||= Lotus::Router.new do
        get '/', to: DatabaseController::Index
        get '/tables/:table_name', to: TablesController::Index
        get '/tables/:table_name/:record_id', to: TablesController::Show
      end
    end

  end

end
