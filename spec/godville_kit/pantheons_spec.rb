require 'spec_helper'

describe 'Pantheons' do
  subject { GodvilleKit::Pantheons.new(raw_pantheons_data) }

  let(:raw_pantheons_data) { JSON.parse(fixture_contents('raw_pantheons_data.json')) }

  describe '#new' do
    it { should be_a(GodvilleKit::Pantheons) }
    its(:gratitude) { should eq('−') }
    its(:might) { should eq('−') }
    its(:templehood) { should eq('−') }
    its(:gladiatorship) { should eq('−') }
    its(:storytelling) { should eq('−') }
    its(:mastery) { should eq('12269') }
    its(:taming) { should eq('−') }
    its(:survival) { should eq('2607') }
    its(:creation) { should eq('163') }
    its(:destruction) { should eq('−') }
    its(:arkeology) { should eq('−') }
    its(:unity) { should eq('2') }
    its(:popularity) { should eq('4') }
    its(:aggressiveness) { should eq('2') }
  end
end
