def assert_equal expected, got
  expected.should == got
end

describe 'StringExt' do
  it 'test_string' do
    assert_equal("a", "a")
    assert_equal("a", " a ".strip)
    assert_equal("cba", "abc".reverse)
    assert_equal("bc", "abc".slice(1, 2))
    assert_equal("abcd", "abcff".gsub("ff",to:"d"))
    assert_equal(3, "abc".length)
    assert_equal(true, "abc".include("a"))
    assert_equal("aB", SWF("a%@", "B"))
    assert_equal("aaaaa", "a".repeat(5))
    assert_equal(3, "3".to_int)
    assert_equal(3.14, "3.14".to_float)
    assert_equal(3.14, "3.14f".to_float)
    assert_equal(3.14, "3.14".to_double)
    assert_equal(["a","b","c"], "a b c".split(" "))
    assert_equal("", Empty)
    assert_equal(" ", SPACE)
    # assert_equal("\t", TABCHAR)
  end
end
