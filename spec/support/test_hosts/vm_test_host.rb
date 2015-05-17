require 'rspec'

class VmTestHost
  def name
    'ubuntuvm'
  end
  def ssh_key
    '.vagrant/machines/ubuntuvm/virtualbox/private_key'
  end
  
  def before_all(scope)
    scope.instance_exec do
      unless `vagrant status #{test_host_name}`.include?('running')
        system "vagrant up #{test_host_name}"
      end
    end
  end
end
