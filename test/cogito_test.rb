require 'test_helper'

class CogitoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cogito::VERSION
  end

  def test_to_json
    actual = Cogito.to_json(read(:iam), value1: 'alpha', value2: 'mu')
    assert_equal read(:json), actual
  end

  def test_to_iam
    expected = read(:iam).gsub('${value1}', 'alpha').gsub('${value2}', 'mu')
    assert_equal expected, Cogito.to_iam(read(:json))
  end

  def test_to_iam_with_error
    assert_raises Cogito::CogitoError do
      Cogito.to_iam('invalid json')
    end
  end

  private

  def read(type)
    File.read(File.expand_path(File.join('files', "test.#{type}"), __dir__))
  end
end
