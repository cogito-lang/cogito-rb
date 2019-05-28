# frozen_string_literal: true

require 'cogito/cogito'
require 'cogito/version'

# A small ruby library that wraps libcogito
module Cogito
  class << self
    def to_json(str, subs = {})
      convert_to_json(substitute(str, subs))
    end

    private

    def substitute(str, subs)
      substituted = str.dup
      subs.each do |key, value|
        substituted.gsub!("${#{key}}", value)
      end
      substituted
    end
  end
end
