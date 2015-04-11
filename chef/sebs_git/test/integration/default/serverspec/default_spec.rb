require 'spec_helper'

describe 'sebs_git::default' do

  describe command('git --version') do
    its(:stdout) { should match /git version 1\.7\./ }
  end

end
