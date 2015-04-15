require 'spec_helper'

describe 'my_app::default' do
  describe command('ruby -v') do
    its(:stdout) { should match /^ruby\ 2\.1\.5/ }
  end
end
