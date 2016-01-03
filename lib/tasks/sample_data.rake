namespace :farezy do
  desc "Create sample data for testing"
  task create_sample_data: :environment do
    
    #Atlanta
    c = City.find_or_create_by(name: "Atlanta")
    c.image_url = "http://7-themes.com/data_images/out/17/6825086-atlanta-wallpaper.jpg"
    c.font_color_hex = "#FFFFFF"
    c.save

    fare = Fare.find_or_initialize_by(city: c)
    fare.cost = 2.50
    fare.save

    day_passes = [{days: 1, cost: 9}, {days: 2, cost: 14}, {days: 3, cost: 16}, {days: 4, cost: 19}, {days: 7, cost: 23.75}]
    day_passes.each do |day_pass|
      dp = DayPass.find_or_initialize_by(city: c, days: day_pass[:days])
      dp.cost = day_pass[:cost]
      dp.save
    end

    #Boston
    c = City.find_or_create_by(name: "Boston")
    c.image_url = "http://7-themes.com/data_images/out/60/6978212-boston-city-2013.jpg"
    c.font_color_hex = "#FFFFFF"
    c.save

    fare = Fare.find_or_initialize_by(city: c)
    fare.cost = 2.65
    fare.save

    day_passes = [{days: 1, cost: 12}, {days: 7, cost: 19}]
    day_passes.each do |day_pass|
      dp = DayPass.find_or_initialize_by(city: c, days: day_pass[:days])
      dp.cost = day_pass[:cost]
      dp.save
    end


  end
end