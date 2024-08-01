# frozen_string_literal: true

module Game
  class Play < Base
    TURNS = %w[rock paper scissors].freeze
    RULES = YAML.load_file(Rails.root.join('config', 'game_rules.yml'))

    attr_accessor :final_decision

    def self.call(game_params)
      new(game_params).call
    end

    def call
      validate_user_turn
      return self if errors.any?

      self.enemy_turn = fetch_enemy_turn
      play_game

      self
    end

    private

    attr_reader :user_turn
    attr_accessor :enemy_turn

    def initialize(game_params)
      @user_turn = game_params[:turn]
      @enemy_turn = nil
      @final_decision = nil

      super()
    end

    def validate_user_turn
      self.errors = { turn: 'Wrong user turn' } if TURNS.exclude?(user_turn)
    end

    def fetch_enemy_turn
      response = RockPaperScissors::Client.new.throw
      puts response.inspect
      return TURNS.sample if response.code != '200'

      response.body[:body]
    end

    def play_game
      rule_key = "#{user_turn}_#{enemy_turn}"
      puts rule_key
      self.final_decision = RULES[rule_key]
    end
  end
end
