require 'station'

describe Station do
  
  subject {described_class.new('Brockley', 2)}

  it 'knows its name' do
    expect(subject.name).to eq('Brockley')
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(2)
  end

end