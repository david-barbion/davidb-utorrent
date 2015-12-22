require 'spec_helper'
describe 'utorrent' do

  context 'with defaults for all parameters' do
    it { should contain_class('utorrent') }
  end
end
