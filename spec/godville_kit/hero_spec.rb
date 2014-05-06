require 'spec_helper'

describe 'Hero' do
  subject { GodvilleKit::Hero.new(raw_hero_data, raw_pantheons_data) }

  let(:raw_hero_data) { JSON.parse(fixture_contents('raw_hero_data.json')) }
  let(:raw_pantheons_data) { JSON.parse(fixture_contents('raw_pantheons_data.json')) }

  describe '#new' do
    it{ should be_a(GodvilleKit::Hero) }
    its(:equipment) { should be_a(GodvilleKit::Equipment) }
    its('equipment.weapon') { should be_a(GodvilleKit::Gear) }
    its('inventory.first') { should be_a(GodvilleKit::Item) }
    its('skills.first') { should be_a(GodvilleKit::Skill) }
    its('diary.first') { should be_a(GodvilleKit::DiaryEntry) }

    context 'with no raw_hero_data' do
      let(:raw_hero_data) { nil }

      its(:pantheons) { should be_a(GodvilleKit::Pantheons) }
      its(:equipment) { should be_nil }
      its('inventory') { should be_nil }
      its('skills') { should be_nil }
      its('diary') { should be_nil }
    end

    context 'with no raw_pantheons_data' do
      let(:raw_pantheons_data) { nil }

      its(:pantheons) { should be_nil }
      its(:equipment) { should be_a(GodvilleKit::Equipment) }
      its('equipment.weapon') { should be_a(GodvilleKit::Gear) }
      its('inventory.first') { should be_a(GodvilleKit::Item) }
      its('skills.first') { should be_a(GodvilleKit::Skill) }
      its('diary.first') { should be_a(GodvilleKit::DiaryEntry) }
    end

    context 'with no raw_hero_data and raw_pantheons_data' do
      let(:raw_hero_data) { nil }
      let(:raw_pantheons_data) { nil }

      its(:pantheons) { should be_nil }
      its(:equipment) { should be_nil }
      its('inventory') { should be_nil }
      its('skills') { should be_nil }
      its('diary') { should be_nil }
    end
  end
end
