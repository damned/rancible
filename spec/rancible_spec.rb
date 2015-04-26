require 'rspec'

describe 'ransible' do
  vm = 'ubuntuvm'
  before(:each) do
    unless `vagrant status #{vm}`.include?('running')
      system "vagrant up #{vm}"
    end
  end

  it 'can execute an ansible command' do
    result = `ANSIBLE_HOST_KEY_CHECKING=False ansible #{vm} --inventory-file=hosts -m stat -a 'path=/tmp' --private-key=.vagrant/machines/ubuntuvm/virtualbox/private_key --user=vagrant -vvv`
    expect(result).to include '| success'
  end
end
