every 1.day at: '00:01 am' do
    runner "CheckSubscriptionsService.new.call"
    runner "CheckPremiumPeriod.new.call"
end