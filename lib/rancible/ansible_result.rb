module Rancible
  class AnsibleResult
    def initialize(output)
      @output = output
    end

    def success?
      output.include? 'success >>'
    end

    private

    attr_reader :output
  end
end