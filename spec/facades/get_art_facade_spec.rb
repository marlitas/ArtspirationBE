require 'rails_helper'

describe GetArtFacade do
  context "instance methods" do
    it "returns parks matching selections" do
      number = 100
      size = 'large'
      selection = GetArtFacade.show_me_art(number, size)
      expect(selection).to be_an Hash
      expect(selection.count).to eq(100)
      expect(selection.keys.first).to be_a(String)
      expect(selection.values.first).to be_a(String)
    end
  end

  context 'Download Image' do
    it 'converts jpeg to base_64' do
      number = 100
      size = 'large'
      selection = GetArtFacade.show_me_art(number, size)

      url = selection
      image = selection.values.first
      encrypted_hash = GetArtFacade.jpeg_to_base64(url)
      decrypted_hash = Base64.strict_decode64(encrypted_hash.values.first)

      expect(encrypted_hash.values.first).to_not eq(decrypted_hash) 
    end
  end
end
