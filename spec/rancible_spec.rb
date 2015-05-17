require 'spec_helper'
require_relative '../lib/rancible'

describe 'rancible' do
  include_context :test_host

  include Rancible::Dsl

  it 'can execute an ansible command' do
    result = rancible(host: test_host_name) do
      stat path: '/tmp'
    end
    expect(result.success?).to be true
  end


end
