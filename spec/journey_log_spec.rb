require 'journey_log'

describe JourneyLog do
  let(:station) { double (:station) }
  let(:journey_class) { double (:journey) }
  subject(:journey_log) { described_class.new(journey_class) }

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  describe '#start' do
    it 'starts a journey' do
      allow(journey_class).to receive(:start).and_return(station)
      expect(subject.start(station)).to eq station
    end

    it 'stores the entry station' do
      allow(journey_class).to receive(:start)
      allow(journey_class).to receive(:entry_station).and_return(station)
      subject.start(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#finish' do
  
  before :each do
    allow(journey_class).to receive(:finish)
    allow(journey_class).to receive(:exit_station).and_return(station)
  end

    it 'stores the finish station' do
      subject.finish(station)
      expect(subject.finish_station).to eq station
    end

    it 'stores the journey' do
      subject.finish(station)
      expect(subject.journeys[-1]).to eq journey_class
    end
  end

  describe '#retrieve' do
    it 'returns a list of journeys' do
      expect(subject.retrieve).to be_an(Array)
    end
  end
end
