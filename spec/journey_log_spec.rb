require 'journey_log'

describe JourneyLog do
  let(:station) { double (:station) }
  let(:journey_class) { double (:journey_class) }
  subject(:journey_log) { described_class.new(journey_class) }

  before :each do
    allow(journey_class).to receive(:new)
    allow(journey_class).to receive(:start).and_return(station)
    allow(journey_class).to receive(:fare)
    allow(journey_log).to receive(:fare)
    allow(subject.current_journey).to receive(:start)
    allow(subject.current_journey).to receive(:entry_station).and_return(station)
    allow(subject.current_journey).to receive(:exit_station).and_return(station)
    allow(subject.current_journey).to receive(:finish)
    allow(subject.current_journey).to receive(:exit_station)
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
    allow(subject.current_journey).to receive(:finish)
    allow(subject.current_journey).to receive(:exit_station).and_return(station)
    subject.finish(station)
  end

    it 'stores the exit station' do
      expect(subject.exit_station).to eq station
    end

    it 'stores the journey' do
      expect(subject.journeys).not_to be_empty
    end
  end

  describe '#retrieve' do
    it 'returns a list of journeys' do
      subject.finish(station)
      expect(subject.retrieve).to be_a_kind_of(Array)
    end
  end
end
