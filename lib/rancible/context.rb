require_relative 'ansible_result'
require_relative 'ansible_runner'

module Rancible
  class Context
    def initialize(params)
      @params = params
    end
    def stat(args)
      AnsibleResult.new(AnsibleRunner.new(@params).run :stat, args)
    end
  end

end