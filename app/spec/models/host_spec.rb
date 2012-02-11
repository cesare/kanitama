require 'spec_helper'

describe Host do
  describe "new instance" do
    context "with valid arguments" do
      subject { Host.new(:name => 'test-name', :ipaddress => '10.3.1.4') }
      it { should be_valid }
    end
    
    context "with no argument" do
      subject { Host.new }
      it { should_not be_valid }
      it { should have(1).errors_on(:name) }
      it { should have(1).errors_on(:ipaddress) }
    end
    
    context "with empty arguments" do
      subject { Host.new(:name => '', :ipaddress => '') }
      it { should_not be_valid }
      it { should have(1).errors_on(:name) }
      it { should have(1).errors_on(:ipaddress) }
    end
    
    context "with an invalid ipaddress" do
      subject { Host.new(:name => 'test-name', :ipaddress => 'this-is-not-ipaddress') }
      it { should_not be_valid }
      it { should have(1).errors_on(:ipaddress) }
    end
    
    context "with an impossible ipaddress" do
      subject { Host.new(:name => 'test-name', :ipaddress => '987.123.0.1') }
      it { should_not be_valid }
      it { should have(1).errors_on(:ipaddress) }
    end
    
    context "with an IPv6 address" do
      subject { Host.new(:name => 'test-name', :ipaddress => '::1') }
      it { should_not be_valid }
      it { should have(1).errors_on(:ipaddress) }
    end
  end
end
