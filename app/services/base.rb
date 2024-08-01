# frozen_string_literal: true

class Base
  attr_accessor :errors

  def initialize
    @errors = {}
  end

  private

  def valid?
    errors.empty?
  end
end
