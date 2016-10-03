require 'test_helper'
require 'record'

class Prev::NextTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Prev::Next::VERSION
  end

  def test_empty_recordset
    assert_empty Prev::Next.index([])
  end

  def test_single_record
    i = Prev::Next.index(records(1))
    assert_equal 1, i.keys.length
    assert_equal nil, i[1][:prev]
    assert_equal nil, i[1][:next]
  end

  def test_recordset_of_two
    i = Prev::Next.index(records(2))
    assert_equal 2, i.keys.length
    assert_equal nil, i[1][:prev]
    assert_equal 2,   i[1][:next].id
    assert_equal 1,   i[2][:prev].id
    assert_equal nil, i[2][:next]
  end

  def test_recordset_of_three
    i = Prev::Next.index(records(3))
    assert_equal 3,   i.keys.length
    assert_equal nil, i[1][:prev]
    assert_equal 2,   i[1][:next].id
    assert_equal 1,   i[2][:prev].id
    assert_equal 3,   i[2][:next].id
    assert_equal 2,   i[3][:prev].id
    assert_equal nil, i[3][:next]
  end
  def test_recordset_of_four
    i = Prev::Next.index(records(4))
    assert_equal 4,   i.keys.length
    assert_equal nil, i[1][:prev]
    assert_equal 2,   i[1][:next].id
    assert_equal 1,   i[2][:prev].id
    assert_equal 3,   i[2][:next].id
    assert_equal 2,   i[3][:prev].id
    assert_equal 4,   i[3][:next].id
    assert_equal 3,   i[4][:prev].id
    assert_equal nil, i[4][:next]
  end

  private
  def records(size)
    r = Array.new
    for i in 1..size
      r << Record.new(i)
    end
    return r
  end
end
