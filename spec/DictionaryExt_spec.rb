def assert_equal expected, got
  expected.should == got
end

describe 'DictionaryExt' do
  it 'test_mutable_dictionary' do
    assert_equal(false, {}.isKindOfClass(NSString))
    assert_equal(true, {}.isKindOfClass(NSMutableDictionary))
    assert_equal(true, {}.isKindOfClass(NSDictionary))
    assert_equal(true, {}.isKindOfClass(Hash))

    dict = NSMutableDictionary.dictionary
    assert_equal({}, dict)

    dict = NSMutableDictionary.dictionaryWithDictionary({"cat"=>2, "dog"=>1})
    assert_equal({"cat"=>2, "dog"=>1}, dict)
    dict.storeKey("horse", value:5)
    assert_equal(%Q[{"cat"=>2, "dog"=>1, "horse"=>5}], dict.to_s)

    dict.delete("apple")
    assert_equal(%Q[{"cat"=>2, "dog"=>1, "horse"=>5}], dict.to_s)

    dict.delete("cat")
    assert_equal(%Q[{"dog"=>1, "horse"=>5}], dict.to_s)

    dict.merge({"cow" => 7})
    assert_equal(%Q[{"cow"=>7, "dog"=>1, "horse"=>5}], dict.to_s)

    dict.clear
    assert_equal({}, dict)
  end

  it 'test_dictionary' do
    assert_equal({}, NSDictionary.dictionary)
    assert_equal(0, {}.count)
  end
end
