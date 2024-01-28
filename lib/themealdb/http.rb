module Themealdb
  class Http
    URL = 'https://www.themealdb.com/api/json/v1/1/'.freeze
    TIMEOUT = 15

    def initialize(connection: nil)
      @connection = connection || Faraday.new(url: URL) do |faraday|
        faraday.response :json, parser_options: { symbolize_names: true }
        faraday.options[:open_timeout] = TIMEOUT
        faraday.options[:timeout] = TIMEOUT
      end
    end

    private

    def get(url:, params: nil, headers: nil)
      @connection.get(url, params, headers)
    end
  end
end
