require 'rails_helper'

describe UrlEnconderDecoder::Bijective do
  describe "#encode" do

    let(:url_id) { 42 }
    let(:encoder) {
      described_class.new()
    }

    context "When you insert something that is not an intenger to encoder" do
      let(:not_integer) { "woompa loompa" }

      before(:each) do
        allow(encoder).to receive(:encode).with(not_integer).and_raise(TypeError)
      end

      it "Raises a type error" do
        expect{ encoder.encode(not_integer) }.to raise_error(TypeError)
      end
      
    end

    context "When you insert an integer it returns a encoded string" do
      let(:integer) { 42 }
      let(:encoded_string) { "Q" }

      before(:each) do
        allow(encoder).to receive(:encode).with(integer)
      end

      it "It returns the right encoded string" do
        expect(encoder).to receive(:encode).with(integer)
      end

      after(:each) do
        encoder.encode(integer)
      end
      
    end
  end
end