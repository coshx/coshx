require 'spec_helper'

describe Image do
 describe "for_other_users_than" do
   it "returns images which are not created by specified admin" do
      admin1 = Admin.create!(:email=>"test1@coshx.com", :password => "password")
      admin2 = Admin.create!(:email=>"test2@coshx.com", :password => "password")
      image1 = admin1.images.create!
      image2 = admin2.images.create!
      Image.all.count.should eq(2)
      Image.for_other_users_than(admin2).count.should eq(1)
      Image.for_other_users_than(admin1).count.should eq(1)
      Image.for_other_users_than(admin2)[0].should eq(image1)
      Image.for_other_users_than(admin1)[0].should eq(image2)
    end
  end
end

