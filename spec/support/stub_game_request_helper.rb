# frozen_string_literal: true

shared_context 'with succeed game response' do
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
end

shared_context 'with error game response' do
  let(:response_body) { { message: 'Internal server error' } }

  before do
    stub_request(
      :get,
      "#{Rails.configuration.game[:game_url]}/rps-stage/throw"
    ).with(
      headers: {
        'User-Agent' => 'Ruby'
      }
    ).to_return(status: 500, body: response_body.to_json, headers: {})
  end
end

shared_context 'with incorrect game response' do
  let(:response_body) { { statusCode: 200, body: 'incorrect_response' } }

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
end
