require 'spec_helper'

describe Admin do

  describe "relations" do
    it { should have_many :posts }
  end
end
