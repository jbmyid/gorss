module ApplicationHelper

	def feed_class(feed)
		case feed.data.description.length
		when 10..600
			"small"
		when 600..1000
			"medium"
		else
			"large"
		end
	end
end
