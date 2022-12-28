require 'rails_helper'

describe UrlShortener::Services::UrlEncoderDecoder do
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

      it "It returns the right encoded string" do
        encoded = encoder.encode(integer)
        expect(encoded).to eq(encoded_string)
      end

    end
  end
end