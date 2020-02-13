require 'journey_log'

describe JourneyLog do
  let(:station) { double (:station) }
  describe '#start' do
    it 'starts a journey' do
      expect(subject.start(station)).to eq station
    end
  end
end
