# frozen_string_literal: true

module Api
  module V1
    module UserSpace
      class GamesController < ApplicationController
        def play
          result = Game::Play.call(game_params)
          return render json: { errors: result.errors }, status: :unprocessable_entity if result.errors.any?

          render json: { result: result.final_decision }
        end

        private

        def game_params
          params.permit(:turn)
        end
      end
    end
  end
end
