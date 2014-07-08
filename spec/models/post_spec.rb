require 'spec_helper'

describe Post do

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :author }
    it { should validate_presence_of :seo_title }
  end

  describe "relations" do
    it { should belong_to :author }
  end

  describe "default_scope" do
    it "sorts by posted_on by default" do
      described_class.where({}).to_sql.should include('ORDER BY posted_on DESC')
    end
  end

  it "published? is false by default" do
    subject.published?.should be_false
  end

  describe "#permalink_attributes" do
    subject { build_stubbed :published_post, :title => "This'll Exercise Everything & More?" }

    it { subject.permalink_attributes[:year].should == subject.posted_on.year }
    it { subject.permalink_attributes[:month].should == ('%02d' % subject.posted_on.month) }
    it { subject.permalink_attributes[:day].should == ('%02d' % subject.posted_on.day) }
    it { subject.permalink_attributes[:title].should == 'thisll-exercise-everything-more' }
  end

  describe ".build_permalink" do
    let(:params) do
      {
        :year  => '2012',
        :month => '01',
        :day   => '13',
        :title => 'hello-world'
      }
    end
    it { described_class.build_permalink(params).should == '2012/01/13/hello-world' }
  end

  describe "#seo_permalink_attributes" do
    # subject { build_stubbed :published_post, :seo_title => "This'll Exercise Everything & More?" }
    let(:post1){ FactoryGirl.build(:post, :seo_title => "This'll Exercise Everything & More?") }
    # post1.save

    # it { subject.seo_permalink_attributes[:seo_title].should == 'thisll-exercise-everything-more' }
    it { 
      post1.save
      post1.seo_permalink_attributes[:seo_title].should == 'thisll-exercise-everything-more' }
  end

  describe ".seo_build_permalink" do
    let(:params) do
      {
        :seo_title => 'hello-world'
      }
    end
    # it { described_class.build_permalink(params).should == 'hello-world' }
    it { described_class.build_seo_permalink(params).should == 'hello-world' }

  end

  describe ".build_like_permalink" do
    let(:params) { {:year => '2012'} }
    it { described_class.build_like_permalink(params).should == '2012/%/%/%' }
  end

  describe "save callback" do
    context "on published post" do
      subject { build :published_post }
      it "sets the permalink" do
        subject.run_callbacks :save
        subject.permalink.should_not be_nil
      end
    end

    context "on unpublished post" do
      subject { build :post }
      it "doesn't set the permalink" do
        subject.run_callbacks :save
        subject.permalink.should be_nil
      end
    end
  end

  describe "update_callback" do
    context "on published post" do
      subject { build :post}
      it "creates tweet about the blog post" do
        Tweeter.should_receive(:blog_post_tweet).with(subject)
        subject.publish
        subject.run_callbacks :update
      end
    end

    context "on unpublished post" do
      subject { build :post }
      it "doesn't create tweet about blog post" do
        Tweeter.should_not_receive(:blog_post_tweet)
        subject.run_callbacks :save
      end
    end
  end

  describe "#body" do
    # replace this whole block with something that just verifies
    # that attr_markdown :preview, :body was called on the model
    subject { build_stubbed :post }

    it "renders as html" do
      subject.body_html.should match /<h3>Markdown header<\/h3>/
      subject.body_html.should match /<h4>Markdown subheader<\/h4>/
      subject.body_html.should match /Yet another line of markdown text./
    end

    # i changed preview, so need to change test
    #it "generates a shortened preview" do
    #  subject.preview.should match /Markdown header/
    #  subject.preview.should match /This is some more markdown text./
    #  subject.preview.should_not match /Yet another line of markdown text./
    #end

    it "adds ... to the end of the preview content" do
      subject.preview.should match /\.\.\.$/
    end
  end

  describe "#author" do
    let(:author) {FactoryGirl.create(:author)}
    let(:post) {FactoryGirl.create(:post, author: author)}

    it "gets deleted authors" do
      author.destroy
      post.reload
      post.author.should == author
    end
  end

  # describe "#seo_title" do
  #   let(:author) {FactoryGirl.create(:author)}
  #   let(:post1){ FactoryGirl.create(:post, author: author, seo_title: "Google Url") }
  #   let(:post2){ FactoryGirl.build(:post, author: author, seo_title: "Google Url") }

  #   it "should be unique" do
  #     post2.save
  #     post2.should_not be_valid
  #   end

  # end

end
