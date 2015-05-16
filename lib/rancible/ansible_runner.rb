module Rancible
  class AnsibleRunner
    def initialize(params)
      @params = params
    end

    def run(command, args)
      host = params[:host]
      path = args[:path]

      argstring = args.keys.map {|key| "#{key}=#{args[key]}" }.join(' ')
      puts "args: #{argstring}"
      output = `ANSIBLE_HOST_KEY_CHECKING=False ansible #{host} --inventory-file=hosts -m #{command} -a '#{argstring}' --private-key=.vagrant/machines/ubuntuvm/virtualbox/private_key --user=vagrant -vvv`
    end

    private

    attr_reader :params
  end
end