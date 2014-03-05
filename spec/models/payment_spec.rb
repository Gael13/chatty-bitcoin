require 'spec_helper'

describe Payment do
  describe 'validations' do
  	it 'blueprint should be valid' do
  	  Payment.make
  	end
  	
  	%w{transaction bitcoin_address amount}.each do |field|
  	  it "requires #{field}" do
  	    Payment.make_unsaved(field => nil).should_not be_valid
  	  end
  	end

  	it "must be unique payment" do
  	  p = Payment.make
  	  Payment.new(p.attributes).should_not be_valid
  	end
  end 	        
end
