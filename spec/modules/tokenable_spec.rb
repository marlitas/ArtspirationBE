require 'rails_helper'
require './lib/modules/tokenable'

class DummyClass
    extend Tokenable
end

RSpec.describe Tokenable do
    it 'can retreive artsy token', :vcr do
        expect(DummyClass.artsy_token).to be_a(String)
    end
end