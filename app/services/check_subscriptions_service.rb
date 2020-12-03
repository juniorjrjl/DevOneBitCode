class CheckSubscriptionsService
	def call
		Order.where(status: :active).each do |o|
			if o.due_date <= Time.now
				o.update(status: :inactive)
				o.portfolio.update(featured: false)
			end
		end
	end
end