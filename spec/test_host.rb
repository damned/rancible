require 'rspec'
require_relative 'support/test_hosts/local_test_host'
require_relative 'support/test_hosts/vm_test_host'

shared_context :test_host do
  def test_host_name
    test_host.name
  end
  def test_ssh_key
    test_host.ssh_key
  end
  before(:all) {
    test_host.before_all self
  }

  private

  def test_host
    override = ENV['TEST_HOST']
    if override.nil?
      return vm_test_host
    end
    puts "test host override: '#{override}'"
    return local_test_host if override == 'local'
    raise "unknown TEST_HOST: '#{override}'"
  end
  def local_test_host
    LocalTestHost.new
  end
  def vm_test_host
    VmTestHost.new
  end
end
