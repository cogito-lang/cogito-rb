require 'test_helper'

class CogitoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cogito::VERSION
  end

  def test_to_json
    assert_equal read(:json), Cogito.to_json(read(:iam))
  end

  def test_to_iam
    assert_equal read(:iam), Cogito.to_iam(read(:json))
  end

  private

  def read(type)
    File.read(File.expand_path(File.join('..', 'files', "test.#{type}"), __FILE__))
  end
end
