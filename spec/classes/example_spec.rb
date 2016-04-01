require 'spec_helper'

describe 'lists' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "lists class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('lists::params') }
          it { is_expected.to contain_class('lists::install').that_comes_before('lists::config') }
          it { is_expected.to contain_class('lists::config') }
          it { is_expected.to contain_class('lists::service').that_subscribes_to('lists::config') }

          it { is_expected.to contain_service('lists') }
          it { is_expected.to contain_package('lists').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'lists class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('lists') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
