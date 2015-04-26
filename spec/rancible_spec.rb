require 'spec_helper'

describe 'rancible' do
  include_context :test_vm

  xit 'can execute an ansible command' do
    result = rancible host: vm_name do
      stat '/tmp'
    end
    expect(result.success?).to be true
  end


end
