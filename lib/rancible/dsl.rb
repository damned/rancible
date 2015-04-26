require_relative 'context'

module Rancible
  module Dsl
    def rancible(params, &block)
      Context.new(params).instance_eval &block
    end
  end
end