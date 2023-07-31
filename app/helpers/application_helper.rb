module ApplicationHelper
  def time_ago_in_words_with_units(time)
    distance = (Time.zone.now - time).to_i

    if distance < 60
      "#{distance} #{distance == 1 ? 'second' : 'seconds'} ago"
    elsif distance < 3600
      "#{distance / 60} #{(distance / 60) == 1 ? 'minute' : 'minutes'} ago"
    elsif distance < 86400
      "#{distance / 3600} #{(distance / 3600) == 1 ? 'hour' : 'hours'} ago"
    elsif distance < 604800
      "#{distance / 86400} #{(distance / 86400) == 1 ? 'day' : 'days'} ago"
    elsif distance < 2419200
      "#{distance / 604800} #{(distance / 604800) == 1 ? 'week' : 'weeks'} ago"
    else
      time.strftime("%B %d, %Y")
    end
  end
end
