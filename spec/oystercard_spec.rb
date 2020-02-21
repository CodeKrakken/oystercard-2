require 'oystercard'

describe Oystercard do

  let(:zone_1_station) { double :zone_1_station }
  let(:zone_2_station) { double :zone_2_station }
  let(:zone_3_station) { double :zone_3_station }
  let(:journey_log_class) { double :journey_log_class }
  let(:journey_class) { double :journey_class }
  subject(:oystercard) { described_class.new(journey_log_class, journey_class) }
  
  context 'Initialized' do

  before :each do
    allow(journey_log_class).to receive(:new)
  end

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'has a journey log' do
    allow(subject.journey_log).to receive(:exist?).and_return(true)
    expect(subject.journey_log).to exist
  end

  it 'will not touch in if insufficient funds' do
    expect { subject.touch_in(zone_1_station) }.to raise_error "Insufficient funds to touch in"
  end

  it 'can top up the balance' do
    expect { subject.top_up 1}.to change { subject.balance }.by 1
  end

    context 'Topped up' do

      before :each do
        subject.top_up(Oystercard::MAXIMUM_BALANCE-10)
        allow(subject.journey_log).to receive(:start)
        allow(subject.journey_log).to receive(:finish)
      end

      it 'raises an error if the maximum balance is exceeded' do
        expect { subject.top_up 11 }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
      end    

      it 'deducts the correct fare' do
        subject.touch_in(zone_1_station)
        allow(subject.journey_log).to receive(:fare).and_return(1)
        expect { subject.touch_out(zone_1_station) }.to change { subject.balance }.by -1
      end
    end
  end
end