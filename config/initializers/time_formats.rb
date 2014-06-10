Time::DATE_FORMATS[:day_month_year] = "%e %B %y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("#{time.day.ordinalize} %B %y") }
