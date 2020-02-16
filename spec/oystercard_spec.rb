require 'oystercard'

describe Oystercard do
  context 'Initialized' do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey_log_class) { double :journey_log }
  subject(:oystercard) { described_class.new(journey_log_class) }

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

  end
end
end