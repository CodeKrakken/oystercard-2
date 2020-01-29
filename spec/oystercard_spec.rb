require 'oystercard'

describe Oystercard do
  context 'Initialized' do

  let(:entry_station){ double :entry_station }
  let(:exit_station){ double :exit_station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
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

    context 'Touched in successfully' do

      before :each do
        subject.touch_in(entry_station)
      end
  
      it 'can touch in' do
        expect(subject).to be_in_journey
      end

      it 'stores the entry station' do
        expect(subject.entry_station).to eq entry_station
      end

      it 'deducts the minimum fare on touch out' do
        expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
      end

      context 'Completed journey' do

        before :each do
          subject.touch_out(exit_station)
        end

        it 'can touch out' do
          expect(subject).not_to be_in_journey
        end

        it 'stores a journey' do
          expect(subject.journeys[entry_station]).to eq exit_station
        end
      end
    end
  end
end
end