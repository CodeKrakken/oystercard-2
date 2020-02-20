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

    it 'knows if a journey is complete' do
      subject.finish(zone_1_station)
      expect(subject).to be_complete
    end
  end
end