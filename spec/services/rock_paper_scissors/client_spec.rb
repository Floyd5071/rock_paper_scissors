# frozen_string_literal: true

require 'swagger_helper'

describe RockPaperScissors::Client do
  describe '#throw' do
    subject(:service) { described_class.new.throw }

    context 'when connection succeed' do
      let(:response_struct) { RockPaperScissors::Client::Response.new(response_body[:body], true) }

      include_context 'with succeed game response'

      it 'returns valid response' do
        expect(service).to eq(response_struct)
      end
    end

    context 'when connection errors' do
      let(:response_struct) { RockPaperScissors::Client::Response.new(nil, false) }

      include_context 'with error game response'

      it 'returns valid response' do
        expect(service).to eq(response_struct)
      end
    end
  end
end
