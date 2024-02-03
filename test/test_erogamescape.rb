# frozen_string_literal: true

require "test_helper"

class TestErogamescape < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Erogamescape::VERSION
  end

  def test_query
    skip "This test case sends request to the external web service" if ENV["TEST_EXTERNAL_SERVICE"].nil?

    assert_raises(Erogamescape::RuntimeSqlError) do
      ::Erogamescape.query("SELECT pg_sleep(12)")
    end

    sleep 3

    assert_raises(Erogamescape::WrongSqlError) do
      ::Erogamescape.query("SELECT * FROM wrongtablename")
    end

    sleep 3

    result = ::Erogamescape.query("SELECT id, gamename FROM gamelist WHERE id = 28762")
    assert_equal([{ "id" => "28762", "gamename" => "さくらの雲＊スカアレットの恋" }], result)
  end
end
