require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '0 1 * * *' do
  Driver.find_each do |driver|
    CreateWalletHistory.new(driver_id: driver.id).create_wallet_history
  end
end
