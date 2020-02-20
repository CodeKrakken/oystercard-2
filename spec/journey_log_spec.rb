require 'journey_log'

describe JourneyLog do
  let(:station) { double (:station) }
  let(:journey_class) { double (:journey) }
  subject(:journey_log) { described_class.new(journey_class) }

  before :each do
    allow(journey_class).to receive(:start).and_return(station)
    allow(journey_class).to receive(:entry_station).and_return(station)
    allow(journey_class).to receive(:fare)
    allow(journey_log).to receive(:fare)
  end

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
  
  before :each do
    allow(journey_class).to receive(:finish)
    allow(journey_class).to receive(:exit_station).and_return(station)
    subject.finish(station)
  end

    it 'stores the finish station' do
      expect(subject.finish_station).to eq station
    end

    it 'stores the journey' do
      expect(subject.journeys[-1]).to eq journey_class
    end
  end

  describe '#retrieve' do
    it 'returns a list of journeys' do
      allow(journey_class).to receive(:finish)
      subject.finish(station)
      expect(subject.retrieve).to eq journey_class
    end
  end
end
