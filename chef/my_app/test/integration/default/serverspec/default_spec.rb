require 'spec_helper'

describe 'my_app::default' do

  describe command('ruby -v') do
    its(:stdout) { should match /^ruby\ 2\.1\.6/ }
  end

  describe port(5432) do
    it { should be_listening }
  end

  describe process("postgres") do
    it { should be_running }
  end

  describe command('which psql') do
    its(:exit_status) { should eq 0 }
  end
end
