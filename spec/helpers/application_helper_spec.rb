require 'spec_helper'

describe ApplicationHelper do

  describe "#rowify" do
    context "single row" do
      let(:things) {["thing1", "thing2"]}
      let(:row_length) {3}

      it "returns a single row" do
        helper.rowify(things, row_length).length.should == 1
      end

      it "has all of the elements" do
        rows = helper.rowify(things, row_length)
        rows.first.should include("thing1")
        rows.first.should include("thing2")
      end

      it "has no extra elements" do
        rows = helper.rowify(things, row_length)
        rows.first.length.should == 2
      end

    end

    context "multiple rows" do
      
      let(:things) {["thing1", "thing2", "thing3", "thing4"]}
      let(:row_length) {3}

      it "returns a two rows" do
        helper.rowify(things, row_length).length.should == 2
      end

      it "has all of the elements" do
        rows = helper.rowify(things, row_length)
        rows.first.should include("thing1")
        rows.first.should include("thing2")
        rows.first.should include("thing3")
        rows.last.should include("thing4")
      end

      it "has no extra elements" do
        rows = helper.rowify(things, row_length)
        rows.first.length.should == 3
        rows.last.length.should == 1
      end

    end
  end

end
