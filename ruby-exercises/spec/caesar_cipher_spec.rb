require './lib/caesar_cipher.rb'

describe 'caesar cipher' do
  it "shifts the characters by n places" do
    expect(caesar_cipher('abcd', 4)).to eql('efgh')
  end
  it "works with numbers bigger than 26" do
    expect(caesar_cipher('abcd', 27)).to eql('bcde')
  end
end