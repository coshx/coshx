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
	
private
	def render_team_members(row)
		enum = row.map #create an enumerator for the row array
		content_tag('div', :id => 'team-row', :class => 'row') do
			row.map do |person|
				if enum.find_index(person)+1 == row.length and row.length > 1
					content_tag('div', render_team_member(person), {:class => ['column', 'two', 'mobile-two'], :style=>"float:left"})
				else
					content_tag('div', render_team_member(person), :class => ['column', 'two', 'mobile-two'])
				end
			end.join.html_safe
		end
	end

	def render_alumni_rows(row)
		enum = row.map #create an enumerator for the row array
		content_tag('div', :id => 'alumni-row', :class => 'row') do
			row.map do |person|
				if enum.find_index(person)+1 == row.length and row.length > 1
					content_tag('div', render_team_member(person), {:class => ['column', 'two', 'mobile-two'], :style=>"float:left"})
				else
					content_tag('div', render_team_member(person), :class => ['column', 'two', 'mobile-two'])
				end
			end.join.html_safe
		end
	end

	def render_team_member(person)
		render(:partial => "home/team_member", :layout => false, :locals => {:person => person})
	end

end