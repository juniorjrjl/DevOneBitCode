gem 'time_difference'

class CheckPremiumPeriod
    def call
        Order.where(status: :active).each do |o|
            if TimeDifference.between(o.due_date, DateTime.now.to_date).in_days == 3
                portfolio = o.portfolio
                user = portfolio.user
                NotifyEndPremiumMailer.with({
                    user: portfolio.profile.name,
                    portfolio: portfolio,
                    email: user.email,
                }).notify.deliver
            end
        end
    end
end