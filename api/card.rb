module Rl
  module API
    module Card
      extend self

      def todos
        todo_column_id = Rl::API::Column.todo_column_id
        cards todo_column_id
      end

      def reading
        reading_column_id = Rl::API::Column.reading_column_id
        cards reading_column_id
      end

      def done
        done_column_id = Rl::API::Column.done_column_id
        cards done_column_id
      end

      private

      def cards column_id
        JSON.parse(client.get("/projects/columns/#{column_id}/cards").body).map{ |card| card["note"] }
      end

      def client
        $container.resolve :api_client
      end
    end
  end
end
