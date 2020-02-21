require 'journey_log'

describe JourneyLog do
  let(:zone_1_station) { double (:zone_1_station) }
  let(:zone_3_station) { double (:zone_3_station) }
  let(:journey_class) { double (:journey_class) }
  subject(:journey_log) { described_class.new(journey_class) }

  before :each do
    allow(journey_class).to receive(:new)
    allow(subject.current_journey).to receive(:start)
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  describe '#start' do

    it 'starts a journey' do
      expect(subject.start(zone_1_station)).to eq zone_1_station
    end

    it 'stores the entry station' do
      allow(subject.current_journey).to receive(:entry_station).and_return(zone_1_station)
      expect(subject.entry_station).to eq zone_1_station
    end
  end

  describe '#finish' do
  
  before :each do
    allow(subject.current_journey).to receive(:exit_station).and_return(zone_3_station)
    allow(subject.current_journey).to receive(:finish)
    subject.finish(zone_3_station)
  end

    it 'stores the exit station' do
      expect(subject.exit_station).to eq zone_3_station
    end

    it 'stores the journey' do
      expect(subject.journeys).not_to be_empty
    end
  end

  describe '#retrieve' do
    it 'returns a list of journeys' do
      expect(subject.retrieve).to be_a_kind_of(Array)
    end
  end

  describe '#fare' do
    it 'retrieves the correct fare from journey class' do
      allow(subject.journey).to receive(:fare).and_return(3)
      subject.start(zone_1_station)
      expect(subject.fare).to eq(3)
    end
  end
end
