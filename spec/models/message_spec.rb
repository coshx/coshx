require "spec_helper"

describe Message do

  describe "validations" do
    it "requires a name and an email" do
      m = Message.new
      expect(m).to_not be_valid

      expect(m.errors["email"]).to include("can't be blank")
      expect(m.errors["name"]).to include("can't be blank")
    end
  end

end
