require 'spec_helper'

describe 'my_app::default' do

  describe command('ruby -v') do
    its(:stdout) { should match /^ruby\ 2\.1\.6/ }
  end

  describe "PostgreSQL" do
    describe process("postgres") do
      it { should be_running }
      its(:cmd) { should include "/postgresql/9.1/bin/postgres\s" }
      it 'runs 9.1' do
        binary = subject.cmd.split(" ").first
        version_query = "#{binary} --version"
        expect(command(version_query).stdout).to match /9\.1\.\d+/
      end
    end

    describe port(5432) do
      it { should be_listening }
    end

    describe command('which psql') do
      its(:exit_status) { should eq 0 }
    end
  end
end
