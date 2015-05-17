require 'rspec'

shared_context :test_vm do
  def vm_name
    'ubuntuvm'
  end
  def vm_ssh_key
    '.vagrant/machines/ubuntuvm/virtualbox/private_key'
  end
  before(:all) {
    unless `vagrant status #{vm_name}`.include?('running')
      system "vagrant up #{vm_name}"
    end
  }
end
