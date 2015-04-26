require 'rspec'

shared_context :test_vm do
  def vm_name
    'ubuntuvm'
  end
  before(:all) {
    unless `vagrant status #{vm_name}`.include?('running')
      system "vagrant up #{vm_name}"
    end
  }
end