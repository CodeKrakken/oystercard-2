require 'oystercard'

describe Oystercard do
  context 'Initialized' do

  let(:zone_1_station) { double :zone_1_station }
  let(:zone_2_station) { double :zone_2_station }
  let(:zone_3_station) { double :zone_3_station }
  let(:journey_log_class) { double :journey_log_class }
  let(:journey_class) { double :journey_class }
  subject(:oystercard) { described_class.new(journey_log_class, journey_class) }

  before :each do
    allow(journey_log_class).to receive(:new)
    allow(journey_log_class).to receive(:finish)
    allow(journey_log_class).to receive(:start)
    allow(subject.journey_log).to receive(:exist?).and_return(true)
    allow(subject.journey_log).to receive(:start)
    allow(subject.journey_log).to receive(:finish)
    allow(journey_log_class).to receive(:journey)
  end

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'has a journey log' do
    expect(subject.journey_log).to exist
  end

  it 'will not touch in if insufficient funds' do
    expect { subject.touch_in(zone_1_station) }.to raise_error "Insufficient funds to touch in"
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
      allow(journey_log_class).to receive(:complete?).and_return(false)
      allow(subject.journey_log).to receive(:fare).and_return(6)
      expect { subject.touch_out(zone_1_station) }.to change { subject.balance }.by -6
    end     

    context 'Touched in zone 1' do

      before :each do
        subject.touch_in(zone_1_station)
      end

      it 'deducts a fare from zone 1 to 1' do
        allow(journey_log_class).to receive(:complete?).and_return(true)
        allow(subject.journey_log).to receive(:fare).and_return(1)
        expect { subject.touch_out(zone_1_station) }.to change { subject.balance }.by -1
      end

      it 'deducts a fare from zone 1 to 2' do
        allow(subject.journey_log).to receive(:fare).and_return(2)
        expect { subject.touch_out(zone_2_station) }.to change { subject.balance }.by -2
      end
    end
  
      context 'Touched in zone 3' do

        it 'deducts a fare from zone 3 to zone 1' do
          allow(subject.journey_log).to receive(:fare).and_return(3)
          subject.touch_in(zone_3_station)
          expect { subject.touch_out(zone_1_station) }.to change { subject.balance }.by -3
        end
      end
    end
  end
end