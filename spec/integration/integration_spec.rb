require 'spec_helper'

describe "press all the buttons", :type => :feature do

	it "should apply grayscale filter when pressing grayscale button", :js => :true do
		visit '/'
		click_button 'grayscale'
		find(:css, '#photo').text == '-webkit-filter:grayscale(100%)'
	end
	
	it "should apply sepia filter when pressing sepia button", :js => :true do
		visit '/'
		click_button 'sepia'
		find(:css, '#photo').text == '-webkit-filter:sepia(100%)'
	end
	
	it "should apply hue-rotate filter when pressing hue-rotate button", :js => :true do
		visit '/'
		click_button 'hue-rotate'
		find(:css, '#photo').text == '-webkit-filter:hue-rotate(90deg)'
	end
	
	it "should apply invert filter when pressing invert button", :js => :true do
		visit '/'
		click_button 'invert'
		find(:css, '#photo').text == '-webkit-filter:invert(100%)'
	end
	
	it "should apply opacity filter when pressing opacity button", :js => :true do
		visit '/'
		click_button 'opacity'
		find(:css, '#photo').text == '-webkit-filter:opacity(30%)'
	end
	
	it "should apply brightness filter when pressing brightness button", :js => :true do
		visit '/'
		click_button 'brightness'
		find(:css, '#photo').text == '-webkit-filter:brightness(15%)'
	end
	
	it "should apply contrast filter when pressing contrast button", :js => :true do
		visit '/'
		click_button 'contrast'
		find(:css, '#photo').text == '-webkit-filter:contrast(200%)'
	end
	
	it "should apply blur filter when pressing blur button", :js => :true do
		visit '/'
		click_button 'blur'
		find(:css, '#photo').text == '-webkit-filter:blur(2px)'
	end
	
	it "should remove all filters when pressing the reset button", :js => :true do
		visit '/'
		click_button 'contrast'
		find(:css, '#photo').text == ''
	end
	
end