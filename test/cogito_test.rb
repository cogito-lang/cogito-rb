require 'test_helper'

class CogitoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cogito::VERSION
  end
end
