require 'oystercard'

describe Oystercard do
  context 'Initialized' do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey_log_class) { double :journey_log_class }
  subject(:oystercard) { described_class.new(journey_log_class) }

  before :each do
    allow(journey_log_class).to receive(:new)
  end

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'has a journey log' do
    allow(journey_log_class).to receive(:exist?).and_return(true)
    expect(subject.journey_log).to exist
  end

  it 'will not touch in if insufficient funds' do
    expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient funds to touch in"
  end

  context 'Topped up' do

    before :each do
      subject.top_up(Oystercard::MAXIMUM_BALANCE-10)
    end

    it 'can top up the balance' do
      expect { subject.top_up 1}.to change { subject.balance }.by 1
    end

    it 'raises an error if the maximum balance is exceeded' do
      expect { subject.top_up 11 }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end

    it 'charges a penalty fare when given no entry station' do
      allow(journey_log_class).to receive(:complete?)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by -6
    end     

    context 'Touched in zone 1' do

      before :each do
        subject.touch_in(zone_1_station)
      end

      xit 'calculates a fare from zone 1 to 1' do
        subject.finish(zone_1_station)
        expect(subject.fare).to eq 1
      end

      xit 'calculates a fare from zone 1 to 2' do
        subject.finish(zone_2_station)
        expect(subject.fare).to eq 2
      end
    end
  
      context 'Touched in zone 3' do

        xit 'calculates a fare from zone 3 to zone 1' do
          subject.touch_in(zone_3_station)
          expect subject.touch_out(zone_1_station).to change { subject.balance }.by -3
        end
      end
    end
  end
end