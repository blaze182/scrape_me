namespace :scraper do
  desc "Run warranty scraper"
  task run: :environment do
    puts 'Updating warranty statuses'
    Warranty.all.each do |w|
      w.save
    end
    puts 'Finished'
  end

end
