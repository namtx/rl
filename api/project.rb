module Rl
  module API
    module Project
      extend self

      def id
        @id ||= JSON.parse(client.get("/repos/#{user_name}/#{repo_name}/projects").body).first["id"]
      end

      private

      def user_name
        $container.resolve(:configuration).user_name
      end

      def repo_name
        $container.resolve(:configuration).repo_name
      end

      def client
        $container.resolve(:api_client)
      end
    end
  end
end
