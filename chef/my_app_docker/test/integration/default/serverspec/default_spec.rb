require 'spec_helper'

describe 'my_app_docker::default' do

  it 'has docker installed' do
    expect(command('docker').exit_status).to eql 0
  end
end
