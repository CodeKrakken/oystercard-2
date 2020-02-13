require 'journey_log'

describe JourneyLog do
  let(:station) { double (:station) }

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  describe '#start' do
    it 'starts a journey' do
      expect(subject.start(station)).to eq station
    end

    it 'stores the entry station' do
      subject.start(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      expect(subject.finish(station)).to eq station
    end

    it 'stores the finish station' do
      subject.finish(station)
      expect(subject.finish_station).to eq station
    end
  end
end
