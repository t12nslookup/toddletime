Date::DATE_FORMATS[:long_ordinal] = lambda { |time| time.strftime("%A #{time.day.ordinalize} %b %Y")}
Date::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("#{time.day.ordinalize} %B %y") }
Time::DATE_FORMATS[:day_month_year] = "%e %B %y"
