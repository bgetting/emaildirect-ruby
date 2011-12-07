require 'emaildirect'
require 'json'

module EmailDirect
  # Represents a database and associated functionality
  class Database
    class << self
      def all
        response = EmailDirect.get '/Databases'
        Hashie::Mash.new(response)
      end

      def create(name, options = {})
        options.merge! :ColumnName => name
        response = EmailDirect.post '/Databases', :body => options.to_json
        Hashie::Mash.new(response)
      end
    end

    attr_reader :column_name

    def initialize(column_name)
      @column_name = column_name
    end

    def details
      response = EmailDirect.get "/Databases/#{column_name}"
      Hashie::Mash.new(response)
    end
  end
end

