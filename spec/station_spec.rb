require 'station'

describe Station do
  
  subject {described_class.new('Brockley', 2)}

  it 'knows its name' do
    expect(subject.name).to eq('Brockley')
  end

end