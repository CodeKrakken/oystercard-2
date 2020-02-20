require 'journey'

describe Journey do

  let(:zone_1_station) { double :zone_1_station, zone: 1 }
  let(:zone_2_station) { double :zone_2_station, zone: 2 }
  let(:zone_3_station) { double :zone_3_station, zone: 3 }

  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(zone_1_station)).to eq(subject)
  end

  it 'has an entry station' do
    expect(subject.start(zone_1_station)).to eq zone_1_station
  end

  it 'knows if a journey is complete' do
    subject.start(zone_1_station)
    subject.finish(zone_1_station)
    expect(subject).to be_complete
  end

  it 'calculates the correct fare from zone 1 to zone 3' do
    subject.start(zone_1_station)
    subject.finish(zone_3_station)
    expect(subject.fare).to eq 3
  end
end
