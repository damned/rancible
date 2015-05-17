require 'rspec'

class LocalTestHost
  def name
    'localhost'
  end
  def ssh_key
    '~/.ssh/id_rsa'
  end
  def before_all(scope)

  end
end
