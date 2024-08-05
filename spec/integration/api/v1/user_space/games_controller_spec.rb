# frozen_string_literal: true

require 'swagger_helper'

describe Api::V1::UserSpace::GamesController do
  path '/user_space/games/play' do
    after { |example| example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body) } }

    get 'Play the game' do
      tags 'Game'
      produces 'application/json'
      parameter '$ref' => '#/parameters/turn'

      let(:turn) { 'rock' }
      let(:response_body) { { statusCode: 200, body: 'rock' } }

      before do
        stub_request(
          :get,
          "#{Rails.configuration.game[:game_url]}/rps-stage/throw"
        ).with(
          headers: {
            'User-Agent' => 'Ruby'
          }
        ).to_return(status: 200, body: response_body.to_json, headers: {})
      end

      response '200', 'Success' do
        let(:expected_result) { { result: 'tied' } }

        run_test! do
          expect(JSON.parse(response.body)).to eq(expected_result.stringify_keys)
        end
      end
    end
  end
end
