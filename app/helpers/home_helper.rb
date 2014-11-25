module HomeHelper
  def render_team
		content = ''
		@team.each_slice(6) do |row|
			content << render_team_members(row)
		end
		return content.html_safe
	end

	def render_alumni
		content = ''
		@alumni.each_slice(6) do |row|
			content << render_alumni_rows(row)
		end
		return content.html_safe
	end

  def render_projects
    content = ''
    index = 1
    @featured_projects.each_slice(3) do |row|
      content << render_project_rows(row, index)
      content << render_project_description_rows(row, index)
      index = index + 3
    end
    return content.html_safe
  end
	
private
	def render_team_members(row)
		enum = row.map #create an enumerator for the row array
		content_tag('div', id: 'team-row', class: 'row') do
			row.map do |person|
				if enum.find_index(person)+1 == row.length and row.length > 1
					content_tag('div', render_team_member(person), {class: ['column', 'two', 'mobile-two'], style: "float:left"})
				else
					content_tag('div', render_team_member(person), class: ['column', 'two', 'mobile-two'])
				end
			end.join.html_safe
		end
	end

	def render_alumni_rows(row)
		enum = row.map #create an enumerator for the row array
		content_tag('div', id: 'alumni-row', class: 'row') do
			row.map do |person|
				if enum.find_index(person)+1 == row.length and row.length > 1
					content_tag('div', render_team_member(person), {class: ['column', 'two', 'mobile-two'], style: "float:left"})
				else
					content_tag('div', render_team_member(person), {class: ['column', 'two', 'mobile-two']})
				end
			end.join.html_safe
		end
	end

  def render_project_rows(row, index)
    enum = row.map
    content_tag('div', class: ['row', 'featured-project-row']) do
      row.map do |project|
        if enum.find_index(project)+1 == row.length and row.length > 1
          tag = content_tag('div', render_featured_project(project), {class: ['column', 'four', "project-#{index}", 'mobile-four'], style: "float:left"})
        else
          tag = content_tag('div', render_featured_project(project), {class: ['column', 'four', "project-#{index}", 'mobile-four']})
        end
        index = index + 1
        tag
      end.join.html_safe
    end
  end

  def render_project_description_rows(row, index)
    enum = row.map
    row.map do |project|

      alignment = set_alignment(index)

      tag = content_tag('div', render_featured_project_description(project), {class: ['row', 'project-description', "project-description-#{index}", "align-#{alignment}"]})
      index = index + 1
      tag
    end.join.html_safe
  end

  def set_alignment(index)
    if index % 3 == 1
      "left"
    elsif index % 3 == 2
      "middle"
    else
      "right"
    end
  end

  def render_featured_project(project)
    render(partial: "home/featured_project", layout: false, locals: {project: project})
  end

  def render_featured_project_description(project)
    render(partial: "home/featured_project_description", layout: false, locals: {project: project})
  end

	def render_team_member(person)
		render(partial: "home/team_member", layout: false, locals: {person: person})
	end

end