require 'spec_helper'

describe 'APIRequester' do
  subject { GodvilleKit::APIRequester.new(nil, nil, nil, nil) }

  describe '#request_raw_hero_data' do
    context 'when authenticated' do
      it 'returns json' do
        allow(subject).to receive(:authenticated?) { true }
        allow(RestClient).to receive(:get) { fixture_contents('raw_hero_data.json') }
        expect(subject.request_raw_hero_data).to be_a(Hash)
      end
    end

    context 'when not authenticated' do
      it 'returns nil' do
        allow(subject).to receive(:authenticated?) { false }
        allow(RestClient).to receive(:get) { fixture_contents('raw_hero_data.json') }
        expect(subject.request_raw_hero_data).to be_nil
      end
    end
  end

  describe '#request_raw_pantheons_data' do
    context 'when authenticated' do
      it 'returns json' do
        allow(subject).to receive(:authenticated?) { true }
        allow(RestClient).to receive(:get) { fixture_contents('raw_pantheons_data.json') }
        expect(subject.request_raw_pantheons_data).to be_a(Hash)
      end
    end

    context 'when not authenticated' do
      it 'returns nil' do
        allow(subject).to receive(:authenticated?) { false }
        allow(RestClient).to receive(:get) { fixture_contents('raw_pantheons_data.json') }
        expect(subject.request_raw_pantheons_data).to be_nil
      end
    end
  end

  describe '#request_hero' do
    before do
      allow(subject).to receive(:authenticate)
      allow(subject).to receive(:request_raw_hero_data)
      allow(subject).to receive(:request_raw_pantheons_data)
    end

    it 'returns valid hero object' do
      expect(subject.request_hero).to be_a(GodvilleKit::Hero)
    end
  end
end
