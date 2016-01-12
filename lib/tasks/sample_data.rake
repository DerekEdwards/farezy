namespace :farezy do
  desc "Create sample data for testing"
  task create_sample_data: :environment do
    
    #Atlanta
    puts "Creating/updating Atlanta . . . "
    c = City.find_or_create_by(name: "Atlanta")
    c.image_url = "http://7-themes.com/data_images/out/17/6825086-atlanta-wallpaper.jpg"
    c.font_color_hex = "#FFFFFF"
    c.card_name = "Breeze Card"
    c.map_url = "http://40.media.tumblr.com/tumblr_ltqywcrHTc1r54c4oo1_1280.jpg"
    c.save

    fare = Fare.find_or_initialize_by(city: c)
    fare.cost = 2.50
    fare.save

    #Create Fare Task
    fare_task = Task.where(fare: fare).first_or_initialize
    fare_task.save
    fare_task.steps.destroy_all
    steps = [{index: 1, title: "Find a Breeze Machine(need more info)", body: "Here is a picture of a breeze machine.<br><img src='http://ukc.ksea.org/UKC2015/images/direct5.jpg'>"}, {index: 2, title: "Click buy a new Breeze Card", body: "Here is a picture of how to do that . . . <pic needed>"}, {index: 3, title: "Pay up!", body: "Here is a picture of how to do that . . . <pic needed>"}]   
    steps.each do |step|
      new_step = Step.new
      new_step.index = step[:index]
      new_step.title = step[:title]
      new_step.body  = step[:body]
      new_step.task = fare_task
      new_step.save
    end

    day_passes = [{days: 1, cost: 9}, {days: 2, cost: 14}, {days: 3, cost: 16}, {days: 4, cost: 19}, {days: 7, cost: 23.75}]
    day_passes.each do |day_pass|
      dp = DayPass.find_or_initialize_by(city: c, days: day_pass[:days])
      dp.cost = day_pass[:cost]
      dp.save

      #Create New Task for this Day Pass
      task = Task.where(day_pass: dp).first_or_initialize
      task.save
      task.steps.destroy_all
      steps = [{index: 1, title: "Find a Breeze Machine(need more info)", body: "Here is a picture of a breeze machine.<br><img src='http://ukc.ksea.org/UKC2015/images/direct5.jpg'>"}, {index: 2, title: "Click buy a new Breeze Card", body: "Here is a picture of how to do that . . . <pic needed>"}, {index: 3, title: "Pay up!", body: "Here is a picture of how to do that . . . <pic needed>"}]   
      steps.each do |step|
        new_step = Step.new
        new_step.index = step[:index]
        new_step.title = step[:title]
        new_step.body  = step[:body]
        new_step.task = task
        new_step.save
      end
    end

    #Boston
    puts "Creating/updating Boston . . . "
    c = City.find_or_create_by(name: "Boston")
    c.image_url = "http://7-themes.com/data_images/out/60/6978212-boston-city-2013.jpg"
    c.font_color_hex = "#FFFFFF"
    c.card_name = "Charlie Ticket"
    c.map_url = "http://www.mbta.com/images/subway-spider.jpg"
    c.save

    fare = Fare.find_or_initialize_by(city: c)
    fare.cost = 2.65
    fare.save

    #Create Fare Task
    fare_task = Task.where(fare: fare).first_or_initialize
    fare_task.save
    fare_task.steps.destroy_all
    steps = [{index: 1, title: "Find a Fare Machine", body: "Here is a picture of a fare machine.<br><img src='http://s3-media2.fl.yelpcdn.com/bphoto/wKKCOhPMCYD9WD_h2e-iyQ/o.jpg'>"}, {index: 2, title: "Click buy a new Charlie Ticket", body: "Here is a picture of how to do that . . . <pic needed>"}, {index: 3, title: "Pay up!", body: "Here is a picture of how to do that . . . <pic needed>"}]   
    steps.each do |step|
      new_step = Step.new
      new_step.index = step[:index]
      new_step.title = step[:title]
      new_step.body  = step[:body]
      new_step.task = fare_task
      new_step.save
    end

    day_passes = [{days: 1, cost: 12}, {days: 7, cost: 19}]
    day_passes.each do |day_pass|
      dp = DayPass.find_or_initialize_by(city: c, days: day_pass[:days])
      dp.cost = day_pass[:cost]
      dp.save

      #Create New Task for this Day Pass
      task = Task.where(day_pass: dp).first_or_initialize
      task.save
      task.steps.destroy_all
      steps = [{index: 1, title: "Find a Fare Machine", body: "Here is a picture of a fare machine.<br><img src='http://s3-media2.fl.yelpcdn.com/bphoto/wKKCOhPMCYD9WD_h2e-iyQ/o.jpg'>"}, {index: 2, title: "Click buy a new Charlie Ticket", body: "Here is a picture of how to do that . . . <pic needed>"}, {index: 3, title: "Pay up!", body: "Here is a picture of how to do that . . . <pic needed>"}]   
      steps.each do |step|
        new_step = Step.new
        new_step.index = step[:index]
        new_step.title = step[:title]
        new_step.body  = step[:body]
        new_step.task = task
        new_step.save
      end
    end

    puts "DONE"

  end
end