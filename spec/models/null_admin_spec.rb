require 'spec_helper'

describe NullAdmin do
  subject { NullAdmin.instance }

  describe "properties" do
    it "responds to slug" do
      subject.slug.should == "not_found"
    end

    it "responds to github" do
      subject.github.should == "not_found"
    end

    it "responds to twitter" do
    subject.twitter.should == "not_found"
    end
    
    it "responds to name" do
    subject.name.should == "Sorry, we couldn't find that person" 
    end

    it "nickname" do
    subject.nickname.should == '' 
    end
    
    it "bio" do
    subject.bio.should == ''
    end
    
    it "likes" do
    subject.likes.should == "Summer breezes, strolls on the beach, and Pho"
    end

    it "dislikes" do
    subject.dislikes.should == "Not being missing, the thick outline around me, and being part of the astral plane"
    end
  end
end
