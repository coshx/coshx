require 'spec_helper'

describe Client do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :company_logo }
    it { should validate_presence_of :site_url }
  end

end
