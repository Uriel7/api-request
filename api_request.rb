require 'net/http'
require 'net/https'
require 'uri'

class ApiRequest
  attr_accessor :url, :headers
  attr_reader :name, :email

  headers = { 'Content-Type' => 'application/json' }

  def post
    ::Net::HTTP::POST.new(uri.request_uri, headers)
  end

  def get
    puts "from get: #{url}"
    ::Net::HTTP.get(uri, headers)
  end

  private

  def uri
    URI.parse(url)
  end
end

class Placeholder < ApiRequest
  SITE = 'http://jsonplaceholder.typicode.com/'.freeze

  def initialize(options)
    @name = options[:name]
    @email = options[:email]
  end

  def photos
    self.url = "#{SITE}photos/"
    @photos ||= get
  end
end
