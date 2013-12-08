def assert_equal expected, got
  expected.should == got
end

describe 'ArrayExt' do
  it 'test_mutable_array' do
    assert_equal(false, [].isKindOfClass(NSString))
    assert_equal(true, [].isKindOfClass(NSMutableArray))
    assert_equal(true, [].isKindOfClass(NSArray))
    assert_equal(true, [].isKindOfClass(Array))

    ary = NSMutableArray.array
    obj = ary.push("a")
    assert_equal(["a"], obj)
    assert_equal(["a"], ary)

    pop = ary.pop
    assert_equal("a", pop)
    assert_equal([], ary)

    ary.push("a")
    ary.push("a")
    ary.clear
    assert_equal([], ary)
  end

  it 'test_array' do
    ary = NSArray.array
    assert_equal([], ary)
    assert_equal("[]", ary.to_s)
    assert_equal(0, ary.count)

    ary = ["a", "b", "c"]
    assert_equal(%Q{["a", "b", "c"]}, ary.to_s)
    assert_equal(3, ary.count)

    numbers = [1,2,3]
    assert_equal("[1, 2, 3]", numbers.to_s)
    assert_equal("1,2,3", numbers.join(COMMA))
    assert_equal(true, numbers.include(2))
    assert_equal([], ary.slice(3, 1))
    assert_equal("b,c", ary.slice(1, 2).join(COMMA))
    assert_equal("c b a", ary.reverse.join(SPACE))
    assert_equal("a", ary.first)
    assert_equal("b", ary.second)
    assert_equal("c", ary.third)
    assert_equal("c", ary.last)
  end
end
