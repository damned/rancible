require 'rspec'
require_relative 'support/test_hosts/local_test_host'
require_relative 'support/test_hosts/vm_test_host'

TEST_HOSTS = {
  'local' => LocalTestHost.new,
  'vm' => VmTestHost.new,
}
DEFAULT = TEST_HOSTS['vm']

def determine_test_host
  override = ENV['TEST_HOST']
  return DEFAULT if override.nil?

  raise "unknown TEST_HOST: '#{override}'" unless TEST_HOSTS.has_key?(override)

  puts "test host override: '#{override}'"
  TEST_HOSTS[override]
end

TEST_HOST = determine_test_host

shared_context :test_host do
  def test_host_name
    TEST_HOST.name
  end
  def test_ssh_key
    TEST_HOST.ssh_key
  end
  before(:all) {
    TEST_HOST.before_all self
  }

  private

end
