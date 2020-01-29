require 'journey'

describe Journey do
  let(:station) { double :station, zone: 1}

  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  xit 'returns itself when exiting a journey' do
    expect(subject.finish(station)).to eq(subject)
  end

  context 'given an entry station' do
    subject {described_class.new(entry_station: station)}

    xit 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    xit 'returns a penalty fare if no exit station given' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an entry station' do
      let(:other_station) { double :other_station }

      before do
        subject.finish(other_station)
      end

      xit 'calculates a fare' do
        expect(subject.fare).to eq 1
      end

      xit 'knows if a journey is complete' do
        expect(subject).to be_complete
      end
    end
  end
end