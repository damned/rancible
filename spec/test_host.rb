require 'rspec'
require_relative 'support/test_hosts/vm_test_host'

shared_context :test_host do
  def test_host
    VmTestHost.new
  end
  def test_host_name
    test_host.name
  end
  def test_ssh_key
    test_host.ssh_key
  end
  before(:all) {
    test_host.before_all self
  }
end
