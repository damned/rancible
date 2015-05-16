require 'json'

module Rancible
  class AnsibleResult
    def initialize(output)
      @output = output
      puts output
      @data = JSON.parse(output.partition(' >> ').last, symbolize_names: true)
    end

    def success?
      output.include? 'success >>'
    end

    def method_missing(method, *args)
      if data.has_key?(method)
        data[method]
      else
        super
      end
    end

    private

    attr_reader :output, :data
  end
end