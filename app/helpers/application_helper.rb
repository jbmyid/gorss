module ApplicationHelper
  require "feed_color"
	def feed_class(feed)
		case Sanitize.clean(feed.data.description).length
		when 10..600
			"small"
		when 600..2000
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

  def feed_bg_color(feed)
    return "" unless feed.color
    color = YAML::load(feed.color)
    color.bg
  rescue
    ""
  end

  def full_feed_bg_color(feed)
    color = feed.get_color(current_user)
    return "" unless color
    color.bg
    rescue
      ""
  end

  def feed_heading_color(feed)
    return "" unless feed.color
    color = YAML::load(feed.color)
    color.heading
  rescue
    ""
  end

  def full_feed_heading_color(feed)
    color = feed.get_color(current_user)
    return "" unless color
    color.heading
  rescue
    ""
  end


  def display_errors(obj,field)
    return "" unless obj || obj.errors.present?
    obj.errors.messages[field].join("<br>").html_safe
  end

  def date_format(date)
    Date.parse(date).try(:strftime, "%d %b %y") rescue nil
  end
end
