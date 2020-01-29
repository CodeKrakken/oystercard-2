require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  describe '#top_up' do

    it 'can top up the balance' do
      expect { subject.top_up 1}.to change { subject.balance }.by 1
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  describe 'deduct' do

    it 'can deduct a fare' do
      subject.top_up(20)
      expect { subject.deduct 5}.to change{ subject.balance }.by -5
    end
  end

  describe '#touch_in' do

    it 'can touch in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

end