require 'spec_helper'

describe HomeHelper do

  describe "#class_for_service" do
    context "with a long description" do
      let(:service) do
        stub(:description => <<-DESC)
          Etiam porta sem malesuada magna mollis euismod. Lorem ipsum dolor
          sit amet, consectetur adipiscing elit. Nullam id dolor id nibh
          ultricies vehicula ut id elit. Donec id elit non mi porta gravida
          at eget metus. Donec ullamcorper nulla non metus auctor fringilla.
          Maecenas sed diam eget risus varius blandit sit amet non magna.
          Donec sed odio dui. Donec id elit non mi porta gravida at eget metus.
          Integer posuere erat a ante venenatis dapibus posuere velit aliquet.
        DESC
      end

      it { helper.class_for_service(service).should == 'long-stretch-container' }
    end

    context "with a short description" do
      let(:service) do
        stub(:description => <<-DESC)
          Etiam porta sem malesuada magna mollis euismod. Lorem ipsum dolor
          sit amet, consectetur adipiscing elit. Nullam id dolor id nibh
          ultricies vehicula ut id elit. Donec id elit non mi porta gravida
        DESC
      end

      it { helper.class_for_service(service).should == 'short-stretch-container' }
    end
  end

end
