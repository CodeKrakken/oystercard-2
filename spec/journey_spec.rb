require 'journey'

describe Journey do

  let(:zone_1_station) { double :zone_1_station, zone: 1 }
  let(:zone_2_station) { double :zone_2_station, zone: 2 }
  let(:zone_3_station) { double :zone_3_station, zone: 3 }
  let(:zone_200_station) { double :zone_200_station, zone: 200 }

  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(zone_1_station)).to eq(subject)
  end

  context 'given a zone 1 entry station' do
    subject {described_class.new(zone_1_station)}

    it 'has an entry station' do
      expect(subject.entry_station).to eq zone_1_station
    end

    it 'charges a penalty fare when given no exit station' do
      expect(subject.fare).to eq 6
    end      

    it 'calculates a fare from zone 1 to 1' do
      subject.finish(zone_1_station)
      expect(subject.fare).to eq 1
    end

    it 'calculates a fare from zone 1 to 2' do
      subject.finish(zone_2_station)
      expect(subject.fare).to eq 2
    end
    
  end

  context 'given a zone 3 entry station' do
    subject {described_class.new(zone_3_station)}

    it 'calculates a fare from zone 3 to zone 1' do
      subject.finish(zone_1_station)
      expect(subject.fare).to eq 3
    end

    it 'knows if a journey is complete' do
      subject.finish(zone_1_station)
      expect(subject).to be_complete
    end
  end
end