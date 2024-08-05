# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1',
        description: 'RPS Rails API'
      },
      basePath: '/api/v1',
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: '127.0.0.1:3000'
            }
          }
        }
      ],
      parameters: {
        turn: {
          name: :turn,
          in: :query,
          type: :string,
          description: 'You turn. Could be: rock, paper, scissors',
          example: 'rock'
        }
      },
      definitions: {
        ResponseError: {
          type: :object,
          required: %I[error],
          properties: {
            error: {
              type: :string,
              minLength: 1,
              maxLength: 255,
              description: 'Human readable message explaining the error'
            }
          }
        }
      }
    }
  }
end
