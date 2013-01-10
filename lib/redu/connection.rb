require 'faraday'
require 'faraday_middleware'

module Redu
  class Connection
    %w[get post put delete].each do |meth|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{meth}(url = nil, params = {})
          run_request(:#{meth}, url, params)
        end
      RUBY
    end

    def run_request(method, url, params={})
      connection.send(method, url, params)
    end

    protected

    def connection
      @connection ||= Faraday.new(:url => 'http://redu.com.br/api/') do |c|
        c.request  :url_encoded
        c.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
        c.adapter  Faraday.default_adapter
        c.headers = { 'Authorization' => "",
                      'Content-type' => 'application/json' }
      end
    end
  end
end