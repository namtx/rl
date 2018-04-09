module Rl
  module API
    module Column
      extend self

      def todo_column_id
        all.find { |cl| cl["name"] = "To Do" }["id"]
      end

      def reading_column_id
        all.find { | cl| cl["name"] == "In progress" }["id"]
      end

      def done_column_id
        all.find { |cl| cl["name"] == "Done" }["id"]
      end

      private

      def project_id
        Rl::API::Project.id
      end

      def all
        JSON.parse(client.get("/projects/#{project_id}/columns").body)
      end

      def client
        $container.resolve :api_client
      end
    end
  end
end
