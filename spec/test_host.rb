require 'rspec'

shared_context :test_host do
  def test_host_name
    'ubuntuvm'
  end
  def test_ssh_key
    '.vagrant/machines/ubuntuvm/virtualbox/private_key'
  end
  before(:all) {
    unless `vagrant status #{test_host_name}`.include?('running')
      system "vagrant up #{test_host_name}"
    end
  }
end
