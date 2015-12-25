require 'spec_helper'
describe 'emacs_contextmenu' do

  context 'with defaults for all parameters' do
    it { should contain_class('emacs_contextmenu') }
  end
end
