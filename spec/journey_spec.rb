require 'journey'

describe Journey do

  let(:zone_1_station) { double :zone_1_station, zone: 1 }
  let(:zone_3_station) { double :zone_3_station, zone: 3 }

  it 'returns entry station upon start' do
    expect(subject.start(zone_1_station)).to eq zone_1_station
  end

  context 'touched in' do

    before :each do
      subject.start(zone_1_station)
    end

    it 'knows if a journey is not complete' do
      expect(subject).not_to be_complete
    end

    it 'has an entry station' do
      expect(subject.entry_station).to eq zone_1_station
    end

    it 'returns itself when exiting a journey' do
      expect(subject.finish(zone_1_station)).to eq(subject)
    end

    it 'calculates the correct fare from zone 1 to zone 3' do
      subject.finish(zone_3_station)
      expect(subject.fare).to eq 3
    end

    context 'touched out' do

      before :each do
        subject.finish(zone_1_station)
      end

      it 'calculates the correct fare from zone 1 to zone 1' do
        expect(subject.fare).to eq 1
      end

      it 'has an exit station' do
        expect(subject.exit_station).to eq zone_1_station
      end

      it 'knows if a journey is complete' do
        expect(subject).to be_complete
      end
    end
  end  
end
