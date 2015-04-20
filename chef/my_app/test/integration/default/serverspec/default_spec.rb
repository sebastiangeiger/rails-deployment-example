require 'spec_helper'

describe 'my_app::default' do

  describe command('ruby -v') do
    its(:stdout) { should match /^ruby\ 2\.1\.6/ }
  end

  describe command('git --version') do
    its(:stdout) { should include "git version 2.3.5" }
  end

  describe "PostgreSQL" do
    describe user('postgres') do
      it { should exist }
    end

    describe group('postgres') do
      it { should exist }
    end

    describe process("postgres") do
      it { should be_running }
      its(:cmd) { should include "/postgresql/9.1/bin/postgres\s" }
      it 'runs 9.1' do
        binary = subject.cmd.split(" ").first
        version_query = "#{binary} --version"
        expect(command(version_query).stdout).to match /9\.1\.\d+/
      end
      its(:user) { should eq "postgres" }
      its(:group) { should eq "postgres" }
    end

    describe port(5432) do
      it { should be_listening }
    end

    describe command('which psql') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe "Rails deployment" do
    describe user('deploy') do
      it { should exist }
      it { should belong_to_group 'deploy' }
    end

    describe group('deploy') do
      it { should exist }
    end

    describe file('/var/www/rails_sample_app/current/app') do
      it { should be_directory }
      it { should be_owned_by 'deploy' }
      it { should be_grouped_into 'deploy' }
    end

    describe file('/var/www/rails_sample_app/current/app/models/message.rb') do
      it { should be_file }
    end
  end
end
