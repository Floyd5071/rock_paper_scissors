# frozen_string_literal: true

class Base
  attr_accessor :errors

  def initialize
    @errors = {}
  end
end
