require 'rails_helper'

describe GetArtFacade do
  context "instance methods" do
    it "returns parks matching selections" do
      selection = GetArtFacade.show_me_art
      expect(selection).to be_an Hash
      expect(selection.count).to eq(100)
      expect(selection.keys.first).to be_a(String)
      expect(selection.values.first).to be_a(String)
    end
  end
end