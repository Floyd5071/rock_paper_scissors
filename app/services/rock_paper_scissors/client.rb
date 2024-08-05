# frozen_string_literal: true

require 'uri'
require 'net/http'

module RockPaperScissors
  class Client
    Response = Struct.new(:body, :success)

    def initialize
      uri = URI(Rails.configuration.game[:game_url])
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true
    end

    def throw
      path = '/rps-stage/throw'
      process_response(request(path))
    end

    private

    attr_reader :http

    def request(path)
      get_request(path)
    end

    def get_request(path)
      req = Net::HTTP::Get.new(path, {})

      http.request(req)
    end

    def process_response(response)
      body = begin
        parsed_json = JSON.parse(response.body)
        parsed_json.deep_symbolize_keys[:body]
      rescue StandardError => e
        Rails.logger.warn(e)
        nil
      end
      Response.new(body, response.is_a?(Net::HTTPSuccess))
    end
  end
end
