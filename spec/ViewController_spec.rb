def assert_equal expected, got
  expected.should == got
end

describe "ViewController" do
  tests ViewController

  it 'view has green background color' do
    assert_equal(controller.view.backgroundColor, UIColor.greenColor)
  end
end
