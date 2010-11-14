require 'spec_helper'
require 'helpers/trees'

shared_examples_for 'TDiff' do |method|
  include Helpers::Trees

  it "should tell if two trees are identical" do
    @tree.send(method,@tree).all? { |change,node|
      change == ' '
    }.should == true
  end

  it "should stop if the root nodes have changed" do
    changes = @tree.send(method,@different_root).to_a

    changes.length.should == 2

    changes[0][0].should == '-'
    changes[0][1].should == @tree

    changes[1][0].should == '+'
    changes[1][1].should == @different_root
  end
end
