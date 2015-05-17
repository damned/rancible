require 'spec_helper'

describe 'working ansible' do
  include_context :test_host

  it 'can execute an ansible command' do
    result = `ANSIBLE_HOST_KEY_CHECKING=False ansible #{test_host_name} --inventory-file=hosts -m stat -a 'path=/tmp' --private-key=#{test_ssh_key} --user=vagrant -vvv`
    expect(result).to include '| success'
  end

end
