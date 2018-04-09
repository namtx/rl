module Rl
  class Configuration
    def initialize
      @container = Container.new
    end

    def user_name= user_name
      container.register :user_name, user_name
    end

    def user_name
      container.resolve :user_name
    end

    def repo_name= repo_name
      container.register :repo_name, repo_name
    end

    def repo_name
      container.resolve :repo_name
    end

    def access_token= access_token
      container.register :access_token, access_token
    end

    def access_token
      container.resolve :access_token
    end

    private

    attr_reader :container
  end
end
