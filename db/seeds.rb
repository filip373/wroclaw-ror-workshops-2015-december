puts "Seeds: start"
load(Rails.root.join('db', 'seeds', "#{Rails.env.downcase}.rb"))
puts "Seeds: done"
