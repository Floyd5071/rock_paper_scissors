# frozen_string_literal: true

require 'swagger_helper'

describe Game::Play do
  describe '#call' do
    subject(:service) { described_class.call(game_params) }

    let(:game_params) { { turn: 'rock' } }

    include_context 'with succeed game response'

    context 'when all params are present and valid' do
      it 'does not return errors' do
        expect(service.errors).to be_empty
      end

      it 'plays the game' do
        expect(service.final_decision).to eq(:tied)
      end
    end

    context 'when required param is missing' do
      let(:game_params) { {} }

      it 'returns errors' do
        expect(service.errors).not_to be_empty
      end

      it "doesn't play the game" do
        expect(service.final_decision).to be_nil
      end
    end

    context 'when client response not succeed' do
      include_context 'with error game response'

      it 'does not return errors' do
        expect(service.errors).to be_empty
      end

      it 'plays the game' do
        expect(Game::Play::DECISIONS).to include(service.final_decision)
      end
    end
  end
end
