require 'spec_helper_acceptance'

motd_file = '/etc/motd'

pp = <<-PUPPETCODE
    class { motd:
      content => lookup('litmus'),
    }
PUPPETCODE

describe 'Message of the day' do
  context 'uses hiera' do
    it do
			bolt_upload_file('spec/acceptance/hiera_test.yaml', '/root/hiera_test.yaml')
			apply_manifest(pp, hiera_config: '/root/hiera_test.yaml')

			expect(file(motd_file)).to be_file
			expect(file(motd_file)).to contain 'litmus + hiera works'
    end
  end
end
