class Project < ActiveRecord::Base
  has_many :quotes
  attr_accessible :title, :client_name, :location_id, :icon, :picture, :permalink, :summary, :description, :background_color, :url
  validates_uniqueness_of :title
  has_permalink

  def self.featured
    Project.where.not(location_id: nil).sort{ |x, y| x.location_id <=> y.location_id }
  end

  def permalink_attributes
    {:title => title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')}
  end

  def self.build_permalink(params)
    "#{params[:title]}"
  end

  def previous()
    prev_projects = Project.where("id < ?", self.id)
    if prev_projects.any?
      return prev_projects.order("id desc").first
    else 
      return Project.order("id desc").first
    end
  end

  def next()
    next_projects = Project.where("id > ?", self.id)
    if next_projects.any?
      return next_projects.order("id asc").first
    else 
      return Project.order("id asc").first
    end
  end

  private

  def set_permalink
    self.permalink = self.class.build_permalink permalink_attributes
  end
end
