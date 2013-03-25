module ApplicationHelper

	def feed_class(feed)
		case Sanitize.clean(feed.data.description).length
		when 10..600
			"small"
		when 600..1000
			"medium"
		else
			"large"
		end
	end

	# def display_errors(obj, *options)
 #    return "" unless obj || obj.errors.present?
 #    opts = options.last || {}
 #    errors = []
 #    obj.errors.full_messages.each do |m|
 #      errors << content_tag(:li, m, class: opts[:li_class])
 #    end
 #    content_tag(:ul, errors.join().html_safe, class: opts[:ul_class])
 #  end


  def display_errors(obj,field)
    return "" unless obj || obj.errors.present?
    obj.errors.messages[field].join("<br>").html_safe
  end
end
