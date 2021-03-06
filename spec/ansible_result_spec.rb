require_relative 'spec_helper'
require_relative '../lib/rancible'

module Rancible
  describe AnsibleResult do

    it 'determines success from presence of success at start of result' do
      result = AnsibleResult.new('host | success >> { "changed": false }')

      expect(result.success?).to eq true
    end

    it 'determines failure from absence of success at start of result' do
      result = AnsibleResult.new('host | FAILED >> { "failed": true, "msg": "oh dear" }')

      expect(result.success?).to eq false
    end

    it 'exposes result data as methods' do
      result = AnsibleResult.new('host | success >> { "changed": false, "dest": "somedest" }')

      expect(result.changed).to eq false
      expect(result.dest).to eq 'somedest'
    end
  end
end
