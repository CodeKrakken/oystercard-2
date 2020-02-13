require 'journey_log'
require 'journey'

describe JourneyLog do
  let(:station) { double (:station) }
  journey_class = Journey.new(:station)
  subject(:journey_log) { described_class.new(journey_class) }

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
    it 'stores the finish station' do
      subject.finish(station)
      expect(subject.finish_station).to eq station
    end

    it 'stores the journey' do
      subject.finish(station)
      expect(subject.journeys[-1]).to be_a(Journey)
    end
  end

  describe '#retrieve' do
    it 'returns a list of journeys' do
      expect(subject.retrieve).to be_an(Array)
    end
  end
end
