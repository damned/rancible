require 'spec_helper'
require_relative '../lib/rancible'

describe 'rancible' do
  include_context :test_host
  include Rancible::Dsl


  it 'can execute an ansible copy' do
    destination_file = '/tmp/somefile'
    test_content = 'some-content'

    result = nil

    rancible(host: test_host_name) do
      result = copy content: test_content, dest: destination_file
    end

    expect(result.success?).to be true
    expect(result.dest).to eq destination_file
    expect(result.state).to eq 'file'
    expect(result.size).to eq test_content.size
  end


end
