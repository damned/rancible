require_relative 'ansible_result'
require_relative 'ansible_runner'

module Rancible
  class Context
    def initialize(params)
      @params = params
    end
    def copy(args)
      run :copy, args
    end
    def stat(args)
      run :stat, args
    end

    private

    def run(command, args)
      AnsibleResult.new(AnsibleRunner.new(@params).run command, args)
    end
  end

end