require 'spec_helper'
require 'json'

describe "Demo Service" do
	before(:each) do
		puts "I run before the test"
	end

	before(:all) do
		puts "I run before everything"
	end

  it "should print out an info string" do
    stub_response =  "Successful test"
    stub_application = OpenStruct.new({ :response => stub_response })
    d = Demo.new(stub_application)
    d.info.should == %q,"Successful test",
  end
  
 it "should razzle things" do
  demo = Demo.new('nonsense')
  demo.razzle(%w/Andy Aditya Matt/).should == "razzle Andy, Aditya, Matt"
 end



end
