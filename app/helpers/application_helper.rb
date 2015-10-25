module ApplicationHelper
	def total(quantity, price)
		quantity * price
	end

	def currency(value)
		value.to_s.gsub('.', ',')
	end

	def date_time(value)
		value.strftime("%d/%m/%Y - %H:%M")
	end
end
